#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

export DOTNET_ROLL_FORWARD="${DOTNET_ROLL_FORWARD:-Major}"
export MSSQL_SA_PASSWORD="${MSSQL_SA_PASSWORD:-Promptathon!2026}"
export MSSQL_CONNECTION_STRING="${MSSQL_CONNECTION_STRING:-Server=sql,1433;Database=PromptathonDb;User Id=sa;Password=${MSSQL_SA_PASSWORD};TrustServerCertificate=True}"

cat > .env <<EOF
DOTNET_ROLL_FORWARD=${DOTNET_ROLL_FORWARD}
MSSQL_CONNECTION_STRING=${MSSQL_CONNECTION_STRING}
EOF

echo "Installing Python data packages..."
if python3 -m pip install --no-cache-dir --upgrade pip >/dev/null 2>&1 \
  && python3 -m pip install --no-cache-dir -r .devcontainer/requirements.txt; then
  echo "Python data packages installed."
else
  echo "Warning: Python data packages did not install. Re-run: python3 -m pip install -r .devcontainer/requirements.txt" >&2
fi

echo "Waiting for SQL Server 2025 to accept connections..."
for attempt in {1..90}; do
  if sqlcmd -S sql,1433 -U sa -P "${MSSQL_SA_PASSWORD}" -C -l 5 -Q "SELECT 1" -b -o /dev/null; then
    break
  fi

  if [ "${attempt}" -eq 90 ]; then
    echo "SQL Server did not become ready in time." >&2
    exit 1
  fi

  sleep 2
done

echo "Creating and seeding PromptathonDb from Zava mini data..."
setup_root="/tmp/promptathon-setup"
setup_zip="/tmp/promptathon-setup.zip"
setup_zip_url="${PROMPTATHON_SETUP_ZIP_URL:-https://sqlaipromptathon.blob.core.windows.net/setup-files/setup.zip}"
rm -rf "${setup_root}"
rm -f "${setup_zip}"
mkdir -p "${setup_root}"
trap 'rm -rf "${setup_root}" "${setup_zip}"' EXIT

curl -fsSL "${setup_zip_url}" -o "${setup_zip}"
unzip -q "${setup_zip}" -d "${setup_root}"
dotnet run \
  --project "${setup_root}/ZavaSeedLoader/ZavaSeedLoader.csproj" \
  -- "${setup_root}/zava-mini"
rm -rf "${setup_root}" "${setup_zip}"
trap - EXIT

echo "Restoring Data API Builder local tool..."
dotnet tool restore
dotnet dab --version

echo "Validating Data API Builder configuration..."
dotnet dab validate --config dab-config.json

echo "Running SQL smoke test..."
sqlcmd \
  -S sql,1433 \
  -U sa \
  -P "${MSSQL_SA_PASSWORD}" \
  -C \
  -d PromptathonDb \
  -b \
  -Q "SELECT 'Products' AS TableName, COUNT(*) AS Rows FROM dbo.Products UNION ALL SELECT 'Customers', COUNT(*) FROM dbo.Customers UNION ALL SELECT 'SalesOrders', COUNT(*) FROM dbo.SalesOrders UNION ALL SELECT 'SupportChats', COUNT(*) FROM dbo.SupportChats UNION ALL SELECT 'Docs', COUNT(*) FROM dbo.Docs;"

echo "Setup complete. Open Copilot Chat in agent mode and ask it to list the SQL MCP tools."

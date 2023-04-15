#Setup test environment & run all tests locally

export PGPASSWORD='postgres'
psql -U postgres -d postgres -h localhost -p 5433 -a -f resources/northwind.sql
if [ $? -ne 0 ]; then
  echo "Failed to run psql script"
  exit 1
fi

./scripts/script1GenerateCodeForExampleProject.sh

./scripts/script3RunAllTestsLocallyAndPubGet.sh

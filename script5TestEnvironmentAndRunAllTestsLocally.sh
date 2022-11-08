#Setup test environment & run all tests locally

export PGPASSWORD='postgres'; psql -U postgres -d postgres -h localhost -p 5433 -a -f resources/northwind.sql

./script1GenerateCode.sh

./script3RunAllTestsLocallyAndPubGet.sh
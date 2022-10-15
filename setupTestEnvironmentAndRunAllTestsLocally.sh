#Setup test environment & run all tests locally

export PGPASSWORD='postgres'; psql -U postgres -d postgres -h localhost -p 5433 -a -f resources/northwind.sql

(
  cd example;
  dart ../easy_orm_cli/bin/easy_orm_cli.dart generate --host localhost --port 5433 --db postgres -u postgres -p postgres --schema public --package example;
  dart run build_runner build --delete-conflicting-outputs
)

(
  cd example;
  dart pub get;
  dart test;
)

(
  cd easy_orm_cli;
  dart pub get;
  dart test;
)

(
  cd easy_orm_engine;
  dart pub get;
  dart test;
)
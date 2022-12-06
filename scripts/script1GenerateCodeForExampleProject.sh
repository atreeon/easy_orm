(
  cd example || exit;
  dart ../easy_orm_cli/bin/easy_orm_cli.dart generate --host localhost --port 5433 --db postgres -u postgres -p postgres --schema public --package example;
)

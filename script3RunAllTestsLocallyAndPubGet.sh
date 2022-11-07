(
  cd example || exit;
  dart pub get;
)

(
  cd easy_orm_cli || exit;
  dart pub get;
)

(
  cd easy_orm_postgres || exit;
  dart pub get;
)

(
  cd example || exit;
  dart test -r github;
)

(
  cd easy_orm_cli || exit;
  dart test -r github;
)

(
  cd easy_orm_postgres || exit;
  dart test -r github;
)
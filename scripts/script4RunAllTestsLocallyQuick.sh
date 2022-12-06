(
  cd easy_orm_postgres || exit;
  dart test;
)

(
  cd easy_orm_cli || exit;
  dart test;
)

(
  cd example || exit;
  dart test;
)
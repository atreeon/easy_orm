# Easy ORM Postgresql

## What is Easy ORM Postgresql?
Easy ORM is an easy way to use your postgres database and map Dart objects to sql and sql results to Dart objects.  

Everything is strongly typed (data returned, queries, inserts etc) and your database models are created for you. 
I don't think I'm wrong in saying that Easy ORM is the only ORM for postgresql that works and achieves this.

ORM stands for Object Relational Mapper https://en.wikipedia.org/wiki/Object%E2%80%93relational_mapping.  Other popular ORMs for other languages include SQLAlchemy & Entity Framework.  

Easy ORM is, currently and hopefully, a low functionality version of these ORMS that supports basic insert, update, select and delete statements.  Where clauses support nested and simple 'and', 'or' statements.  The intention is to use sql rarely and when it is used to use stored procedures or views through this ORM (supported from v0.4.0).

Functionality will be missing but I hope to have the basics nailed down so, if you want a feature or an enhancement, go to github and add an issue.

### Quick example usage
Here we select US States from our Northwind database where state_id is greater than 30 and the name ends in 'ia'.  If you want a feature or an enhancement go to github and add an issue.
```
var result = await EasyOrm<Us_state, Us_statesDefinition>(connection, Us_statesDefinition()) //
  .selectQuery(
where: ((e) => Where(
      Brackets(
        e.state_id.gt(30),
        And(e.state_name.like("%ia")),
      ),
    )),
orderBy: ((e) => OrderBy([
      OrderByItem(e.state_region),
    ])),
);
```

If you want to run the examples in the `example` project, get the source from github, then create a docker sql db (script2CreateLocalSqlDockerDb.sh) 

## How To Use
### Install
1. Install the following dev dependencies and standard dependenciess
```
dart pub add --dev freezed
dart pub add --dev build_runner
dart pub add --dev json_serializable
dart pub add easy_orm_postgres
```
2. Install the CLI by running the following command.  
`dart pub global activate easy_orm_cli`
3. Using the terminal, navigate to your project's root folder (ie the folder with the pubspec.yaml file) then run the `generate` command to create the database .dart files.  You will need to know your database login details and specify all the arguments (host, port, database name, username, password, schemea).  You will also need to specify the 'package' name of your dart project.  The cli will access your database and read from your `information_schema.columns` postgresql table so ensure your sql login has access to it.   
`easy_orm_cli generate --host localhost --port 5433 --db postgres -u postgres -p postgres --schema public --package example`
4. Create a postgresql connection   
`var connection = PostgreSQLConnection('localhost', 5433, 'postgres', username: 'postgres', password: 'postgres');`
5. Add a simple select query (define definition with connection object, then query)
```
  var usStatesDef = EasyOrm<Us_state, Us_statesDefinition>(connection, Us_statesDefinition());

  var result = await usStatesDef.selectQuery(
    where: ((e) => Where(e.state_name.like("%ia"))),
  );
```
6. And print the results (the result if of type SqlResponse_Success or SqlResponse_Failure, here we assume it was a success)   
`print((result as SqlResponse_Success<List<Us_state>>).result);`   
...and that is it.  You can then create code to access your database automatically mapping between objects and avoid
writing any sql code!

## More examples
See `easy_orm\example\test` in github.
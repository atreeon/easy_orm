# Easy ORM Postgresql

## What is Easy ORM Postgresql?
Easy ORM is an easy way to use your postgres database and map Dart objects to sql and sql results to Dart objects.  ORM stands for Object Relational Mapper https://en.wikipedia.org/wiki/Object%E2%80%93relational_mapping.  Other popular ORMs for other languages include SQLAlchemy & Entity Framework.  Easy ORM is a (currently) simplified version of these supporting basic insert, update, select and delete statements.  Where clauses support nested and simple 'and', 'or' statements. 

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

## How To Use
### Install
1. Install the `easy_orm` package:   
`dart pub add easy_orm`
2. Install the CLI by running the following command.  
`dart pub global activate easy_orm_cli`
3. Using the terminal, navigate to your project's root folder (ie the folder with the pubspec.yaml file)
4. Run the `generate` command to create the database .dart files.  You will need to specify all the arguments (host, port, database name, username, password, schemea).  You will also need to specify the 'package' name which is the name of the dart package that you are creating the code for.  The cli will access your database and read from your information_schema.columns so ensure you have access to that postgresql table with the username & password specified.
`easy_orm_cli generate --host localhost --port 5433 --db postgres -u postgres -p postgres --schema public --package example;`

...and that is it.  You can then create code to access your database automatically mapping between objects!

## More examples
See `easy_orm\example\test` in github.
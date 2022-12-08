import 'package:easy_orm_postgres/clauseObjects/OrderBy.dart';
import 'package:easy_orm_postgres/clauseObjects/Update.dart';
import 'package:easy_orm_postgres/clauseObjects/Where.dart';
import 'package:easy_orm_postgres/dbConnection/getPostgresConnectionFromConfig.dart';
import 'package:easy_orm_postgres/service/EasyOrm.dart';
import 'package:easy_orm_postgres/service/SqlResponse.dart';
import 'package:example/generatedDb/db/db.dart';
import 'package:example/generatedDb/definitions/EmployeesDefinition.dart';
import 'package:example/generatedDb/definitions/TerritoriesDefinition.dart';
import 'package:example/generatedDb/definitions/Us_statesDefinition.dart';
import 'package:example/generatedDb/models/Employee.dart';
import 'package:example/generatedDb/models/Territorie.dart';
import 'package:example/generatedDb/models/Us_state.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

void main() {
  group("insert", () {
    tearDown(() async {
      var connection = await getPostgresConnectionFromConfig();
      await connection.open();
      var resetIdentity = "SELECT setval(pg_get_serial_sequence('us_states', 'state_id'), max(state_id)) FROM us_states;";
      await connection.query(resetIdentity);
      await connection.close();
    });

    test("1b insert with identity", () async {
      var connection = await getPostgresConnectionFromConfig();
      await connection.open();
      late SqlResponse<List<Us_state>>? sqlResponse;
      await connection.transaction((ctx) async {
        var data = await EasyOrm<Us_state, Us_statesDefinition>(Us_statesDefinition()) //
            .insertRecords(
          [
            Us_state(state_id: 0, state_abbr: "ab", state_name: "name1", state_region: "region1"),
            Us_state(state_id: 0, state_abbr: "ac", state_name: "name2", state_region: "region2"),
          ],
          cn: ctx,
        );
        sqlResponse = data;
        ctx.cancelTransaction();
      });
      connection.close();

      var expected = [52, 53];
      expect(sqlResponse is SqlResponse_Success<List<Us_state>>, true);
      expect((sqlResponse as SqlResponse_Success<List<Us_state>>).result.map((x) => x.state_id), expected);
    });

    test("2b no identity", () async {
      var connection = await getPostgresConnectionFromConfig();
      await connection.open();
      late SqlResponse<List<Territorie>>? sqlResponse;
      await connection.transaction((ctx) async {
        var data = await EasyOrm<Territorie, TerritoriesDefinition>(TerritoriesDefinition()) //
            .insertRecords(
          [
            Territorie(territory_description: "desc1", region_id: 1, territory_id: "abc1"),
            Territorie(territory_description: "desc2", region_id: 2, territory_id: "abc2"),
          ],
          cn: ctx,
        );
        sqlResponse = data;
        ctx.cancelTransaction();
      });
      connection.close();

      var expected = ["abc1", "abc2"];
      expect(sqlResponse is SqlResponse_Success<List<Territorie>>, true);
      expect((sqlResponse as SqlResponse_Success<List<Territorie>>).result.map((x) => x.territory_id), expected);
    });
  });

  group("run Select Queries", () {
    test("1a us - select *", () async {
      var result = await EasyOrm<Us_state, Us_statesDefinition>(Us_statesDefinition()) //
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

      var expected = [39, 47, 49];
      var resultFormatted = (result as SqlResponse_Success<List<Us_state>>).result.map((x) => x.state_id).toList();
      expect(resultFormatted, expected);
    });

    test("2a us", () async {
      var result = await EasyOrm<Us_state, Us_statesDefinition>(Us_statesDefinition()) //
          .selectQuery2Cols(
        (e) => e.state_id,
        (e) => e.state_name,
        where: ((e) => Where(
              Brackets(
                e.state_id.lt(20),
                And(e.state_name.like("I%")),
              ),
            )),
        orderBy: ((e) => OrderBy(
              [
                OrderByItem(e.state_region),
              ],
            )),
      );

      var expected = [13, 14, 15, 16];
      expect((result as SqlResponse_Success<List<Tuple2>>).result.map((x) => x.item1).toList(), expected);
    });

    test("3a employees", () async {
      var result = await EasyOrm<Employee, EmployeesDefinition>(EmployeesDefinition()) //
          .selectQuery(
        where: ((e) => Where(
              Brackets(
                e.employee_id.gt(5),
                Or(e.employee_id.lt(4)),
              ),
              And(
                e.title_of_courtesy.like("Dr."),
                Or(e.title_of_courtesy.like("Mr.")),
              ),
            )),
        orderBy: ((e) => OrderBy([OrderByItem(e.title_of_courtesy)])),
      );

      var expected = [2, 6, 7];
      expect((result as SqlResponse_Success<List<Employee>>).result.map((x) => x.employee_id).toList(), expected);
    });

    test("4a employees", () async {
      var result = await EasyOrm<Employee, EmployeesDefinition>(EmployeesDefinition()) //
          .selectQuery2Cols(
        (e) => e.last_name,
        (e) => e.title,
        where: ((e) => Where(
              Brackets(
                e.employee_id.gt(5),
                Or(e.employee_id.lt(4)),
              ),
              And(
                e.title_of_courtesy.like("Dr."),
                Or(e.title_of_courtesy.like("Mr.")),
              ),
            )),
        orderBy: ((e) => OrderBy([OrderByItem(e.title_of_courtesy)])),
      );
      var expected = [
        Tuple2("Fuller", "Vice President, Sales"),
        Tuple2("Suyama", "Sales Representative"),
        Tuple2("King", "Sales Representative"),
      ];

      expect((result as SqlResponse_Success<List<Tuple2<String, String?>>>).result.toList(), expected);
    });

    test("5a us - select *", () async {
      var usStatesDef = EasyOrm<Us_state, Us_statesDefinition>(Us_statesDefinition());

      var result = await usStatesDef.selectQuery(
        where: ((e) => Where(e.state_name.like("%ia"))),
      );

      var expected = 6;
      var resultCount = (result as SqlResponse_Success<List<Us_state>>).result.length;
      expect(resultCount, expected);
    });

    test("6a select all columns & rows (no selection criteria)", () async {
      var usStatesDef = EasyOrm<Us_state, Us_statesDefinition>(Us_statesDefinition());

      var result = await usStatesDef.selectQuery();

      var expected = 51;
      var resultCount = (result as SqlResponse_Success<List<Us_state>>).result.length;
      expect(resultCount, expected);
    });

    test("7a simple select using db", () async {
      var result = await Db().us_states.selectQuery(
            where: ((e) => Where(
                  e.state_name.like("%iana"),
                )),
            orderBy: ((e) => OrderBy([
                  OrderByItem(e.state_region),
                ])),
          );

      var expected = [15, 19];
      var resultFormatted = (result as SqlResponse_Success<List<Us_state>>).result.map((x) => x.state_id).toList();
      expect(resultFormatted, expected);
    });

    //todo: joins
    // test("4a inner join", () async {
    //   var connection = await getPostgresConnectionFromConfig();
    //
    //   var data = await EmployeesService(connection: connection) //
    //       .selectEmployees2<TerritoriesDefinition>(
    //     TerritoriesDefinition(),
    //     join1: Join<EmployeesDefinition, TerritoriesDefinition>((e) => e.id, (t) => t.id),
    //     where: ((e, TerritoriesDefinition t) => Where(
    //           Brackets(
    //             e.employee_id.gt(5),
    //             Or(e.employee_id.lt(4)),
    //             Or(t.region_id.gt(3)),
    //           ),
    //           And(
    //             e.title_of_courtesy.like("Dr."),
    //             Or(e.title_of_courtesy.like("Mr.")),
    //           ),
    //         )),
    //     orderBy: ((e) => OrderBy([OrderByItem(e.title_of_courtesy)])),
    //   );
    //
    //   var expected = [2, 6, 7];
    //   expect(data.map((x) => x.employee_id).toList(), expected);
    // });
  });

  group("update", () {
    tearDown(() async {
      var connection = await getPostgresConnectionFromConfig();
      await connection.open();
      var resetIdentity = "SELECT setval(pg_get_serial_sequence('us_states', 'state_id'), max(state_id)) FROM us_states;";
      await connection.query(resetIdentity);
      await connection.close();
    });

    test("1c update one record", () async {
      var connection = await getPostgresConnectionFromConfig();
      await connection.open();
      late SqlResponse<List<Us_state>> result;
      await connection.transaction((ctx) async {
        var data = await EasyOrm<Us_state, Us_statesDefinition>(Us_statesDefinition()) //
            .updateRecords(
          where: (e) => Where(
            e.state_id.eq(2),
          ),
          set: (e) => UpdateCustom(
            {
              e.state_name: "Alaskakakakaaaa",
            },
          ),
          cn: ctx,
        );
        result = data;
        ctx.cancelTransaction();
      });
      connection.close();

      //alaska name

      var expected = Us_state(state_id: 2, state_abbr: "AK", state_name: "Alaskakakakaaaa", state_region: "north");
      expect(result is SqlResponse_Success<List<Us_state>>, true);
      expect(
        (result as SqlResponse_Success<List<Us_state>>).result.single,
        expected,
      );
    });
  });

  group("delete", () {
    tearDown(() async {
      var connection = await getPostgresConnectionFromConfig();
      await connection.open();
      var resetIdentity = "SELECT setval(pg_get_serial_sequence('us_states', 'state_id'), max(state_id)) FROM us_states;";
      await connection.query(resetIdentity);
      await connection.close();
    });

    test("1d delete one record", () async {
      var connection = await getPostgresConnectionFromConfig();
      await connection.open();
      late SqlResponse<int> result;

      await connection.transaction((ctx) async {
        var data = await Db()
            .us_states //
            .deleteRecords(
              (e) => Where(
                e.state_id.eq(2),
              ),
              cn: ctx,
            );
        result = data;
        ctx.cancelTransaction();
      });
      connection.close();

      var expected = 1;
      var resultFormatted = result as SqlResponse_Success<int>;

      expect(resultFormatted.result, expected);
    });
  });
}

import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';
import 'package:easy_orm_engine/dbConnection/getPostgresConnectionFromConfig.dart';
import 'package:easy_orm_engine/runQuery.dart';
import 'package:example/generatedDb/definitions/Us_statesDefinition.dart';
import 'package:example/generatedDb/services/Us_statesService.dart';
import 'package:test/test.dart';

void main() {
  group("runQueries", () {
    test("1a us", () async {
      var service = Us_statesService(
        select: ((e) => SelectDefault<Us_statesDefinition>()),
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

      var connection = await getPostgresConnectionFromConfig();
      var data = await runQuery(service, connection);

      var expected = [39,47,49];
      expect(data.map((x) => x.state_id), expected);
    });

    test("2a us", () async {
      var service = Us_statesService(
        select: ((e) => SelectCustom2([e.state_id, e.state_name])),
        where: ((e) => Where(
              Brackets(
                e.state_id.lt(20),
                And(e.state_name.like("I%")),
              ),
            )),
        orderBy: ((e) => OrderBy([
              OrderByItem(e.state_region),
            ])),
      );

      var connection = await getPostgresConnectionFromConfig();
      var data = await runQuery(service, connection);

      var expected = [13,14,15,16];
      expect(data.map((x) => x.item1), expected);
    });
  });
}

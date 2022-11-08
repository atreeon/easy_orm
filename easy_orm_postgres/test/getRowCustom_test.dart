import 'package:easy_orm_postgres/service/getRowCustom.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

import 'generated/Territorie.dart';
import 'generated/TerritoriesDefinition.dart';

void main() {
  group('getRowCustom', () {
    test('b0', () {
      var input = {
        "territories": {
          "territory_id": "01730",
          "territory_description": "Bedford",
          "region_id": 1,
        },
      };

      var expected = Territorie(
        territory_description: "Bedford",
        region_id: 1,
        territory_id: "01730",
      );

      var actual = TerritoriesDefinition().getTypeFromRow(input);

      expect(actual.toString(), expected.toString());
    });

    test('b1', () {
      var input = {
        "employees": {
          "employee_id": 1,
        },
      };

      var expected = 1;

      var actual = getRowCustom1(input);

      expect(actual, expected);
    });

    test('b2', () {
      var input = {
        "employees": {
          "title_of_courtesy": "Mr.",
          "employee_id": 1,
        },
      };

      var expected = Tuple2<String?, int>("Mr.", 1);

      var actual = getRowCustom2(input);

      expect(actual, expected);
    });
  });
}

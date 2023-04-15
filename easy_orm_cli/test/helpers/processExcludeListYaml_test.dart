import 'package:easy_orm_cli/helpers/processExcludeListYaml.dart';
import 'package:test/test.dart';

import 'processExcludeListYaml_expectedResults/sampleExcludeLists.dart';

void main() {
  group("processExcludeListYaml", () {
    test("a0 ", () {
      var sut = processExcludeListYaml;
      var result = sut(sampleExcludeList1);

      var expected = {
        "customer_customer_demo": null,
        "customer_demographics": null,
        "employees": [
          "photo_path1",
          "photo_path2",
          "photo_path3",
        ],
      };
      expect(result, expected);
    });

    test("a1", () {
      var sut = processExcludeListYaml;
      expect(() => sut(sampleExcludeList2_incorrectlyFormed), throwsException);
    });

    test("a2", () {
      var sut = processExcludeListYaml;
      expect(() => sut(sampleExcludeList3_empty), throwsException);
    });

    test("a3", () {
      var sut = processExcludeListYaml;
      var result = sut(sampleExcludeList4_tableNotExists);

      var expected = {
        "customer_customer_xyz": null,
      };
      expect(result, expected);
    });
  });
}

import 'package:easy_orm_cli/util/dePluralise.dart';
import 'package:test/test.dart';

void main() {
  group("depluralise", () {
    test("1a not a plural", () {
      var result = dePluralise("input");
      expect(result, "input");
    });

    test("2a is a plural", () {
      var result = dePluralise("books");
      expect(result, "book");
    });
  });
}

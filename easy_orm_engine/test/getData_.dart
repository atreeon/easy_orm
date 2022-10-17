// @Tags(['integration'])
//
// import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
// import 'package:easy_orm_engine/clauseObjects/Where.dart';
// import 'package:easy_orm_engine/dbConnection/getPostgresConnectionFromConfig.dart';
// import 'package:easy_orm_engine/runQuery.dart';
// import 'package:test/test.dart';
//
// import 'generated/Employee.dart';
// import 'generated/Employeef1.dart';
// import 'generated/EmployeesService.dart';
// import 'generated/TerritoriesService.dart';
//
// void main() {
//   group('getData', () {
//     test('a1', () async {
//       var service = TerritoriesService.select(
//         where: ((e) => Where(Brackets(
//               e.territory_id.like("01581"),
//               Or(e.territory_id.like("01730")),
//               Or(e.territory_id.like("01833")),
//             ))),
//         orderBy: ((e) => OrderBy([OrderByItem(e.territory_description)])),
//       );
//
//       var connection = await getPostgresConnectionFromConfig();
//       var data = await runQuery(service, connection);
//
//       var expected = [];
//
//       expect(data.toString(), expected.toString());
//     });
//   });
// }

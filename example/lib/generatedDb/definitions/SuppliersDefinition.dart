import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Supplier.dart';

class SuppliersDefinition implements ITableDefinition {
  final String tableName = "suppliers";

  ColumnNumeric<int> supplier_id = ColumnNumeric<int>(
    name: "supplier_id",
    nullable: false,
    datatype: "int2",
    getValue: (row) => row["suppliers"]!["supplier_id"],
  );

  ColumnChar<String> company_name = ColumnChar<String>(
    name: "company_name",
    nullable: false,
    datatype: "varchar",
    getValue: (row) => row["suppliers"]!["company_name"],
  );

  ColumnChar<String> homepage = ColumnChar<String>(
    name: "homepage",
    nullable: true,
    datatype: "text",
    getValue: (row) => row["suppliers"]!["homepage"],
  );

  ColumnChar<String> address = ColumnChar<String>(
    name: "address",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["suppliers"]!["address"],
  );

  ColumnChar<String> city = ColumnChar<String>(
    name: "city",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["suppliers"]!["city"],
  );

  ColumnChar<String> contact_name = ColumnChar<String>(
    name: "contact_name",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["suppliers"]!["contact_name"],
  );

  ColumnChar<String> contact_title = ColumnChar<String>(
    name: "contact_title",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["suppliers"]!["contact_title"],
  );

  ColumnChar<String> country = ColumnChar<String>(
    name: "country",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["suppliers"]!["country"],
  );

  ColumnChar<String> fax = ColumnChar<String>(
    name: "fax",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["suppliers"]!["fax"],
  );

  ColumnChar<String> phone = ColumnChar<String>(
    name: "phone",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["suppliers"]!["phone"],
  );

  ColumnChar<String> postal_code = ColumnChar<String>(
    name: "postal_code",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["suppliers"]!["postal_code"],
  );

  ColumnChar<String> region = ColumnChar<String>(
    name: "region",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["suppliers"]!["region"],
  );

  List<Column> get allColumns => [
        supplier_id,
        company_name,
        homepage,
        address,
        city,
        contact_name,
        contact_title,
        country,
        fax,
        phone,
        postal_code,
        region
      ];

  Supplier getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Supplier(
      supplier_id: row[this.tableName]![this.supplier_id.name],
      company_name: row[this.tableName]![this.company_name.name],
      homepage: row[this.tableName]![this.homepage.name],
      address: row[this.tableName]![this.address.name],
      city: row[this.tableName]![this.city.name],
      contact_name: row[this.tableName]![this.contact_name.name],
      contact_title: row[this.tableName]![this.contact_title.name],
      country: row[this.tableName]![this.country.name],
      fax: row[this.tableName]![this.fax.name],
      phone: row[this.tableName]![this.phone.name],
      postal_code: row[this.tableName]![this.postal_code.name],
      region: row[this.tableName]![this.region.name],
    );
  }
}

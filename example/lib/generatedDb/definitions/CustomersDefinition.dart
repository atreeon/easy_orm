import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:example/generatedDb/models/Customer.dart';

class CustomersDefinition implements ITableDefinition {
  final String tableName = "customers";

  ColumnChar<String> customer_id = ColumnChar<String>(
    name: "customer_id",
    nullable: false,
    datatype: "bpchar",
    getValue: (row) => row["customers"]!["customer_id"],
  );

  ColumnChar<String> company_name = ColumnChar<String>(
    name: "company_name",
    nullable: false,
    datatype: "varchar",
    getValue: (row) => row["customers"]!["company_name"],
  );

  ColumnChar<String> address = ColumnChar<String>(
    name: "address",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["customers"]!["address"],
  );

  ColumnChar<String> city = ColumnChar<String>(
    name: "city",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["customers"]!["city"],
  );

  ColumnChar<String> contact_name = ColumnChar<String>(
    name: "contact_name",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["customers"]!["contact_name"],
  );

  ColumnChar<String> contact_title = ColumnChar<String>(
    name: "contact_title",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["customers"]!["contact_title"],
  );

  ColumnChar<String> country = ColumnChar<String>(
    name: "country",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["customers"]!["country"],
  );

  ColumnChar<String> fax = ColumnChar<String>(
    name: "fax",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["customers"]!["fax"],
  );

  ColumnChar<String> phone = ColumnChar<String>(
    name: "phone",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["customers"]!["phone"],
  );

  ColumnChar<String> postal_code = ColumnChar<String>(
    name: "postal_code",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["customers"]!["postal_code"],
  );

  ColumnChar<String> region = ColumnChar<String>(
    name: "region",
    nullable: true,
    datatype: "varchar",
    getValue: (row) => row["customers"]!["region"],
  );

  List<Column> get allColumns => [
        customer_id,
        company_name,
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

  Customer getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return Customer(
      customer_id: row[this.tableName]![this.customer_id.name],
      company_name: row[this.tableName]![this.company_name.name],
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

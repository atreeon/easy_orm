var sampleExcludeList1 = """#the tables specified here are excluded, must have no tabs / spaces / whitespace before name
customer_customer_demo:
customer_demographics:

#the columns specified include the table name & column name indended by 2 chars
# on the next line
employees:
  photo_path1
  photo_path2
  photo_path3
""";

var sampleExcludeList2_incorrectlyFormed = """#the tables specified here are excluded, must have no tabs / spaces / whitespace before name
  customer_customer_demo
  customer_demographics

  #the columns specified include the table name & column name indended by 2 chars
  # on the next line
  employees
    photo_path""";

var sampleExcludeList3_empty = """""";

var sampleExcludeList4_tableNotExists = """#the tables specified here are excluded, must have no tabs / spaces / whitespace before name
customer_customer_xyz:""";

var sampleExcludeList5_columnNotExists = """#the tables specified here are excluded, must have no tabs / spaces / whitespace before name
customer_customer_demo
  blah_i_dont_exist""";
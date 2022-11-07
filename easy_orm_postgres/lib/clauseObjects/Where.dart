import '../column.dart';

class BracketOrFilter {}

abstract class ClauseSuper {
  String? get sql;

  final BracketOrFilter bracketOrFilter;
  final Command? cmd1;
  final Command? cmd2;
  final Command? cmd3;

  ClauseSuper(this.bracketOrFilter, [this.cmd1, this.cmd2, this.cmd3]);
}

//initial where - bracket or filter, [command]
//Command - bracket or filter, [command]
//bracket - bracket or filter, [command]

class Where implements ClauseSuper {
  final String? sql = null;

  final BracketOrFilter bracketOrFilter;
  final Command? cmd1;
  final Command? cmd2;
  final Command? cmd3;

  Where(this.bracketOrFilter, [this.cmd1, this.cmd2, this.cmd3]);
}

class Brackets implements ClauseSuper, BracketOrFilter {
  final String? sql = null;

  final BracketOrFilter bracketOrFilter;
  final Command? cmd1;
  final Command? cmd2;
  final Command? cmd3;

  Brackets(this.bracketOrFilter, [this.cmd1, this.cmd2, this.cmd3]);
}

abstract class Command extends ClauseSuper {
  Command(super.bracketOrFilter, [super.cmd1, super.cmd2, super.cmd3]);
}

class And extends Command {
  final String sql = "and";

  And(super.bracketOrFilter, [super.cmd1, super.cmd2, super.cmd3]);
}

class Or extends Command {
  final String sql = "or";

  Or(super.bracketOrFilter, [super.cmd1, super.cmd2, super.cmd3]);
}

abstract class Filter implements BracketOrFilter {}

enum eFilterOneValues { eq, gt, gte, lt, lte, like }

class FilterOneValue<T> implements Filter {
  final T data;
  final Column column;
  final String filterOperator;
  FilterOneValue(this.data, this.column, this.filterOperator);
}


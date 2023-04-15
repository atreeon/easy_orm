import 'dart:collection';

sum(Iterable seq, [fn(x)?]) => //
    seq.fold(0,
        (dynamic prev, element) => prev + (fn != null ? fn(element) : element));

max(Iterable seq) => //
    seq.fold(
        0,
        (dynamic prev, element) =>
            prev.compareTo(element) > 0 ? prev : element);

List<GroupByX<TObj, TKey>> groupBy<TObj, TKey>(Iterable<TObj> seq,
    {by(TObj x)? = null, Comparator? matchWith = null, valuesAs(x)? = null}) {
  var map = Map<TKey?, GroupByX<TObj, TKey>>();
  seq.forEach((x) {
    var val = by!(x);
    var key = matchWith != null //
        ? map.keys.firstWhere((k) => matchWith(val, k) == 0, orElse: () => val)
        : val;

    if (!map.containsKey(key)) map[key] = GroupByX<TObj, TKey>(val);

    if (valuesAs != null) x = valuesAs(x);

    map[key]!.add(x);
  });
  return map.values.toList();
}

class GroupByX<TObj, TKey> extends IterableBase<TObj> {
  TKey key;
  List<TObj> _list;
  GroupByX(this.key) : _list = [];

  get iterator => _list.iterator;
  void add(TObj e) => _list.add(e);
  List<TObj> get values => _list;
}

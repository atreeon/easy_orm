///List extensions
extension List_E<T> on List<T> {
  ///add to list if the item is not null
  void addIfNotNull(T? blah) {
    if (blah != null) {
      this.add(blah);
    }
  }
}

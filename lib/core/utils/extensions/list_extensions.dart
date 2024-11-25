extension ListExtensions<E> on List<E> {
  int addAndGetIndex(E element) {
    add(element);
    return length - 1;
  }
}

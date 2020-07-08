class Iterator<T> {
  List<T> list;

  int index = 0;

  Iterator(this.list) : assert(list != null);

  T get prev => this[--index];

  T get next => this[++index];

  T get current => this[index];

  T operator [](int index) => isOutOfRange(index) ? null : list[index];

  bool isOutOfRange(int index) => index + 1 > list.length;
}

extension ReversedIf<T> on List<T> {
  List<T> reversedIf(bool expression) {
    return expression
    ? this.reversed.toList()
    : this;
  }

}

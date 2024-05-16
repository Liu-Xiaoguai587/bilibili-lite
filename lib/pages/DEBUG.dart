class Debug {
  static Function(dynamic argument)? fn;

  static debug() {
    if (fn != null) {
      fn;
    } else {
      return;
    }
  }
}

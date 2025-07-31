enum Rating {
  veryBad(1.0),
  bad(2.0),
  average(3.0),
  good(4.0),
  excellent(5.0);

  final double value;
  const Rating(this.value);
}

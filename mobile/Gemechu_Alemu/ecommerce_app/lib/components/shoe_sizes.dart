enum ShoeSize {
  size38(38),
  size39(39),
  size40(40),
  size41(41),
  size42(42),
  size43(43);

  final int value;
  const ShoeSize(this.value);

  @override
  String toString() => '$value';
}

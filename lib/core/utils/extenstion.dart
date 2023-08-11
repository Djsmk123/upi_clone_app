extension MaskAccountNumber on String {
  String maskAccountNumber() {
    final visibleEnd = substring(length - 4);

    return '****$visibleEnd';
  }
}

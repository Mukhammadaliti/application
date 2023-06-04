class Invoice {
  String firstName;

  String amount;
  String invoiceNumber;
  dynamic date;
  String time;
  String? sId;
  String? course;
  String? teacher;
  String? lvl;
  // String categories;
  Invoice({
    this.course,
    this.lvl,
    this.teacher,
    this.sId,
    required this.time,
    required this.firstName,
    required this.amount,
    required this.invoiceNumber,
    required this.date,
    // required this.categories,
  });
}

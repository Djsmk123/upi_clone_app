class BackAccountModel {
  final String upiId;
  final String accountNumber;
  final String bankName;

  const BackAccountModel(
      {required this.upiId,
      required this.accountNumber,
      required this.bankName});

  factory BackAccountModel.fromJson(Map<String, dynamic> json) {
    return BackAccountModel(
      bankName: json['bank_name'],
      upiId: json['upi_id'],
      accountNumber: json['account_number'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'upi_id': upiId,
      'account_number': accountNumber,
      'bank_name': bankName
    };
  }
}

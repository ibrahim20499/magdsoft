class AccountModel {
  int? status;
  String? message;
  Account? account;

  AccountModel({required this.status, required this.message, required this.account});

  AccountModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;
  }
}

class Account {
  int? id;
  String? name;
  String? phone;

  Account({required this.id, required this.name, required this.phone});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }
}
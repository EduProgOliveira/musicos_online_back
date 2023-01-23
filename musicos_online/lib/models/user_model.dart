import 'dart:convert';

class UserModel {
  int? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  bool? userIsActive;
  DateTime? userDateCreated;
  DateTime? userDateUpdated;

  UserModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userIsActive,
    this.userDateCreated,
    this.userDateUpdated,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['user_id'] as int,
      userName: map['user_name'] as String,
      userEmail: map['user_email'] as String,
      userIsActive: map['user_active'] == 1,
      userDateCreated: map['user_date_created'],
      userDateUpdated: map['user_date_updated'],
    );
  }

  factory UserModel.fromRequest(Map<String, dynamic> map) {
    return UserModel()
      ..userName = map['user_name'] as String
      ..userEmail = map['user_email'] as String
      ..userPassword = map['user_password'] as String;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'userIsActive': userIsActive,
      'userDateCreated': userDateCreated?.millisecondsSinceEpoch,
      'userDateUpdated': userDateUpdated?.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());
}

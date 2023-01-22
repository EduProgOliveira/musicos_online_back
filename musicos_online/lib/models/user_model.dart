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
      userId: map['user_userId'] as int,
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
}

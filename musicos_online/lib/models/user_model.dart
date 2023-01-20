class UserModel {
  final int id;
  final String userName;
  final String email;
  final bool isActive;
  final DateTime dateCreated;
  final DateTime dateUpdated;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.isActive,
    required this.dateCreated,
    required this.dateUpdated,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['user_id'] as int,
      userName: map['user_name'] as String,
      email: map['user_email'] as String,
      isActive: map['user_active'] == 1,
      dateCreated: map['user_date_created'],
      dateUpdated: map['user_date_updated'],
    );
  }
}

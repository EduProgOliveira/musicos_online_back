class UserModel {
  final int id;
  final String userLogin;
  final String userPassword;
  final String dateCreated;
  final String dateUpdated;

  UserModel({
    required this.id,
    required this.userLogin,
    required this.userPassword,
    required this.dateCreated,
    required this.dateUpdated,
  });
}

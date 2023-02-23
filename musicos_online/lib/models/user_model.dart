// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  int? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userUserName;
  String? userGender;
  String? userBiography;
  String? userState;
  String? userCity;
  String? userLat;
  String? userLong;
  bool? userActive;
  bool? userPremium;
  String? musicDefaultTypeId;
  String? musicDefaultTypeTitle;
  String? musicianDefaultTypeId;
  String? musicianDefaultTypeTitle;
  String? instrumentDefaultTypeId;
  String? instrumentDefaultTypeTitle;
  DateTime? userDateCreatedAt;
  DateTime? userDateUpdatedAt;
  DateTime? userDateDeletedAt;

  UserModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.userUserName,
    this.userGender,
    this.userBiography,
    this.userState,
    this.userCity,
    this.userLat,
    this.userLong,
    this.userActive,
    this.userPremium,
    this.musicDefaultTypeId,
    this.musicDefaultTypeTitle,
    this.musicianDefaultTypeId,
    this.musicianDefaultTypeTitle,
    this.instrumentDefaultTypeId,
    this.instrumentDefaultTypeTitle,
    this.userDateCreatedAt,
    this.userDateUpdatedAt,
    this.userDateDeletedAt,
  });

  factory UserModel.fromRequest(Map<String, dynamic> map) {
    return UserModel()
      ..userId = map['user_id']
      ..userName = map['user_name']
      ..userEmail = map['user_email']
      ..userPassword = map['user_password']
      ..userUserName = map['user_username']
      ..userGender = map['user_gender']
      ..userBiography = map['user_biography']
      ..userState = map['user_state']
      ..userCity = map['user_city']
      ..userLat = map['user_lat']
      ..userLong = map['user_long']
      ..userActive = map['user_active']
      ..userPremium = map['user_premium']
      ..musicDefaultTypeId = map['music_default_type_id']
      ..musicDefaultTypeTitle = map['music_default_title']
      ..musicianDefaultTypeId = map['musician_default_type_id']
      ..musicianDefaultTypeTitle = map['musician_default_type_title']
      ..instrumentDefaultTypeId = map['instrument_default_type_id']
      ..instrumentDefaultTypeTitle = map['instrument_default_type_title']
      ..userDateCreatedAt = map['user_date_created_at']
      ..userDateUpdatedAt = map['user_date_updated_at']
      ..userDateDeletedAt = map['user_date_deleted_at'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': userId,
      'user_name': userName,
      'user_email': userEmail,
      'user_password': userPassword,
      'user_username': userUserName,
      'user_gender': userGender,
      'user_biography': userBiography,
      'user_state': userState,
      'user_city': userCity,
      'user_lat': userLat,
      'user_long': userLong,
      'user_active': userActive,
      'user_premium': userPremium,
      'music_type_id': musicDefaultTypeId,
      'music_default_type_id': musicDefaultTypeTitle,
      'musician_type_id': musicianDefaultTypeId,
      'musician_default_type_id': musicianDefaultTypeTitle,
      'instrument_type_id': instrumentDefaultTypeId,
      'instrument_default_type_id': instrumentDefaultTypeTitle,
      'user_date_created_at': userDateCreatedAt?.millisecondsSinceEpoch,
      'user_date_updated_at': userDateUpdatedAt?.millisecondsSinceEpoch,
      'user_date_deleted_at': userDateDeletedAt?.millisecondsSinceEpoch,
    };
  }

  Map<String, dynamic> toUpdate() {
    return <String, dynamic>{
      'user_name': userName,
      'user_email': userEmail,
      'user_password': userPassword,
      'user_username': userUserName,
      'user_gender': userGender,
      'user_biography': userBiography,
      'user_state': userState,
      'user_city': userCity,
      'user_lat': userLat,
      'user_long': userLong,
      'user_active': userActive,
      'user_premium': userPremium,
      'music_type_id': musicDefaultTypeId,
      'music_default_type_id': musicDefaultTypeTitle,
      'musician_type_id': musicianDefaultTypeId,
      'musician_default_type_id': musicianDefaultTypeTitle,
      'instrument_type_id': instrumentDefaultTypeId,
      'instrument_default_type_id': instrumentDefaultTypeTitle,
      'user_date_created_at': userDateCreatedAt?.millisecondsSinceEpoch,
      'user_date_updated_at': userDateUpdatedAt?.millisecondsSinceEpoch,
      'user_date_deleted_at': userDateDeletedAt?.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['user_id'] != null ? map['user_id'] as int : null,
      userName: map['user_name'] != null ? map['user_name'] as String : null,
      userEmail: map['user_email'] != null ? map['user_email'] as String : null,
      userUserName:
          map['user_username'] != null ? map['user_username'] as String : null,
      userGender:
          map['user_gender'] != null ? map['user_gender'] as String : null,
      userBiography: map['user_biography'] != null
          ? map['user_biography'] as String
          : null,
      userState: map['user_state'] != null ? map['user_state'] as String : null,
      userCity: map['user_city'] != null ? map['user_city'] as String : null,
      userLat: map['user_lat'] != null ? map['user_lat'] as String : null,
      userLong: map['user_long'] != null ? map['user_long'] as String : null,
      userActive: map['user_active'] == 1,
      userPremium: map['user_premium'] == 1,
      musicDefaultTypeId: map['music_default_type_id'] != null
          ? map['music_default_type_id'] as String
          : null,
      musicDefaultTypeTitle: map['music_default_type_title'] != null
          ? map['music_default_type_title'] as String
          : null,
      musicianDefaultTypeId: map['musician_default_type_id'] != null
          ? map['musician_default_type_id'] as String
          : null,
      musicianDefaultTypeTitle: map['musician_default_type_title'] != null
          ? map['musician_default_type_title'] as String
          : null,
      instrumentDefaultTypeId: map['instrument_default_type_id'] != null
          ? map['instrument_default_type_id'] as String
          : null,
      instrumentDefaultTypeTitle: map['instrument_default_type_title'] != null
          ? map['instrument_default_type_title'] as String
          : null,
      userDateCreatedAt: map['user_date_created_at'],
      userDateUpdatedAt: map['user_date_updated_at'],
      userDateDeletedAt: map['user_date_deleted_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class User {
  final int? id;
  final String? firstname;
  final String? middleName;
  final String? lastname;
  final String? superLogin;
  final String? username;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? imageUrl;
  final String? status;
  final String? gender;
  final bool? profileCompleted;
  late bool? receiveNotification;
  final bool? emailVerified;

  User({
    this.id,
    this.firstname,
    this.middleName,
    this.lastname,
    this.superLogin,
    this.username,
    this.email,
    this.password,
    this.phoneNumber,
    this.imageUrl,
    this.status,
    this.gender,
    this.profileCompleted,
    this.receiveNotification = false,
    this.emailVerified,
  });

  get updateNotifications => {receiveNotification = !receiveNotification!};
}

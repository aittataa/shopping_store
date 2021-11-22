class UserAddress {
  final int id;
  final int userId;
  final String line1;
  final String line2;
  final String city;
  final String zipCode;
  final String country;
  final String status;

  UserAddress({
    required this.id,
    required this.userId,
    required this.line1,
    required this.line2,
    required this.city,
    required this.zipCode,
    required this.country,
    required this.status,
  });
}

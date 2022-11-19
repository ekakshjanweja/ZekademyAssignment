import 'package:user_profiles/models/address_model.dart';

class User {
  String name;
  String username;
  String email;
  String phone;
  String website;
  Address address;
  User({
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
  });
}

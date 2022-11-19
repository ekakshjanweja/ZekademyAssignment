import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_profiles/models/address_model.dart';
import 'package:user_profiles/models/user_model.dart';

Future<List<User>> getUserData() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  var response = await http.get(url);

  var jsonData = jsonDecode(response.body);

  List<User> users = [];

  for (var u in jsonData) {
    Address address = Address(
      street: u['address']['street'],
      suite: u['address']['suite'],
      city: u['address']['city'],
      zipcode: u['address']['zipcode'],
    );
    User user = User(
      name: u['name'],
      username: u['username'],
      address: address,
      email: u['email'],
      phone: u['phone'],
      website: u['website'],
    );

    users.add(user);
  }

  return users;
}

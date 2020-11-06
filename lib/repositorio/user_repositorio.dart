import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:searchgithub/model/user.dart';

Future<User> getUser(String username) async {
  final response = await http.get('https://api.github.com/users/${username}');

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw ('Registro não encontrado!');
  }
}

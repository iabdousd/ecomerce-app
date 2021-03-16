import 'package:rimlines/models/user/role.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String username;
  Role role;

  User({this.id, this.firstName, this.lastName, this.username, this.role});

  User.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['user']['id'];
    this.firstName = jsonObject['user']['first_name'];
    this.lastName = jsonObject['user']['last_name'];
    this.username = jsonObject['user']['username'];
    this.role = Role.fromJson({
      'rolename': jsonObject['role'],
    });
  }
}

import 'package:rimlines/models/user/role.dart';
import 'package:rimlines/models/user/user.dart';

int balance = null;

String jwtToken;

User currentUser = User(
  id: 1,
  firstName: "Abderrahmane",
  lastName: "Sidi Mohamed",
  role: Role(
    id: 1,
    rolename: "Admin",
  ),
  username: "27086160",
);

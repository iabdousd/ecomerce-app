class Role {
  int id;
  String rolename;

  Role({this.id, this.rolename});

  Role.fromJson(Map<String, dynamic> jsonObject) {
    if (jsonObject != null) {
      this.id = jsonObject['id'];
      this.rolename = jsonObject['rolename'];
    }
  }
}

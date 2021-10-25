class Account {
  int? id;
  String name;
  String password;
  String? username;

  Account(this.name, this.username, this.password, [this.id]);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'id : $id| name: $name| username: $username | password: $password \n';
  }
}

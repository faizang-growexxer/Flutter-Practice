class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map<String, dynamic> address;
  final String phone;
  final String website;
  final Map<String, dynamic> company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.company,
    required this.phone,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      website: json['website'],
      company: json['company'],
    );
  }
}

class UserList {
  final List<User> users;

  UserList({required this.users});

  factory UserList.fromJson(List<dynamic> parsedJson) {
    List<User> users = <User>[];
    users = parsedJson.map((e) => User.fromJson(e)).toList();
    return UserList(users: users);
  }
}

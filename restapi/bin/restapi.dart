import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  // final body = '{"id": 1, "name": "ชาย"}';
  // final json = jsonDecode(body);
  // final male = Gender.fromJson(json);
  // print(male.name);

  // final bodys = '[{"id":1,"name":"ชาย"},{"id":2,"name":"หญิง"}]';
  // final jsons = jsonDecode(bodys) as List;
  // final genders = jsons.map((e) => Gender.fromJson(e)).toList();
  // for (var g in genders) {
  //   print(g.name);
  // }

  // final bodys = '[{"id":1,"name":"ชาย"},{"id":2,"name":"หญิง"}]';
  // final jsons = jsonDecode(bodys) as List;
  // final genders = jsons.map((e) => Gender.fromJson(e)).toList();
  // for (var g in genders) {
  //   print(g.name);
  // }

  // getGender();
  // login();
  getAnimals();
}

void getAnimals() async {
  final jwtToken = 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjMiLCJzdWIiOiJib25kIiwiZW1haWwiOiJib25kIiwibmJmIjoxNjE5NjAxNDU2LCJleHAiOjE2MTk2MjMwNTYsImlhdCI6MTYxOTYwMTQ1Nn0.qTg9MXajzQD_HaeFRj_xfPGzlLzIsvpEEMUqiX5ipi0jyy2vuyoDD0iPmM_51e5rlfiMhNUhTuuQ3RoXEzhRDQ';
  final response = await http.get(
    Uri.parse('https://techcoach.azurewebsites.net/africa/animals'),
    headers: {'Authorization': 'Bearer $jwtToken'},
  );

  if (response.statusCode != 200) {
    print(response.statusCode);
    return;
  }

  print(response.body);
}

void getGender() async {
  final response = await http.get(Uri.parse('https://techcoach.azurewebsites.net/registration/genders'));

  if (response.statusCode != 200) {
    print(response.statusCode);
    return;
  }

  final jsons = jsonDecode(response.body) as List;
  final genders = jsons.map((e) => Gender.fromJson(e)).toList();
  for (var g in genders) {
    print(g.name);
  }

  print(response.body);
}

void login() async {
  final response = await http.post(
    Uri.parse('https://techcoach.azurewebsites.net/registration/login'),
    headers: {'content-type': 'application/json'},
    body: jsonEncode({'email': 'bond', 'password': '123'}),
  );

  if (response.statusCode != 200) {
    print(response.statusCode);
    return;
  }

  final json = jsonDecode(response.body);
  final authUser = AuthUser.fromJson(json);
  print(authUser.firstName);
  print(authUser.gender.name);
}

class Gender {
  int id;
  String name;

  Gender({required this.id, required this.name});

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json['id'],
        name: json['name'],
      );
}

class AuthUser {
  int id;
  String firstName;
  String lastName;
  String email;
  Gender gender;
  String jwtToken;
  AuthUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.jwtToken,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        gender: Gender.fromJson(json['gender']),
        jwtToken: json['jwtToken'],
      );
}

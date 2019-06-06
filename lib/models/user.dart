import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

enum UserType {
  employee,
  employer,
}

@JsonSerializable(nullable: false)
class User {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final UserType type;
  final String avatar;
  final int companyId;

  User(this.id, this.username, this.firstName, this.lastName, this.email, this.type, this.avatar, this.companyId);

 factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}
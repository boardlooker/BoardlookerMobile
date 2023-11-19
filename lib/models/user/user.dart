import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
const factory User({
  required final String username,
  required final String password,
  @JsonKey(name: "full_name")
  required final String fullName,
  required final String birthdate
}) = _User;

factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
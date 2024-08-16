import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String email;
  final String password;
  @JsonKey(name: 'confirm_password')
  final String passwordConfirmation;
  final String phone;
  final int gender;

  SignupRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
    required this.gender,
  });

  factory SignupRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestBodyFromJson(json);
}

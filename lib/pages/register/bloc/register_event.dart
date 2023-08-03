// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class UserName extends RegisterEvent {
  final String userName;
  UserName({
    required this.userName,
  });
}

class Email extends RegisterEvent {
  final String email;
  Email({
    required this.email,
  });
}

class Password extends RegisterEvent {
  final String password;
  Password({
    required this.password,
  });
}

class ConfimPassword extends RegisterEvent {
  final String confirmPassword;
  ConfimPassword({
    required this.confirmPassword,
  });
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class EmailEvent extends SignInEvent {
  final String email;
  EmailEvent({
    required this.email,
  });
}

class PasswordEvent extends SignInEvent {
  final String password;
  PasswordEvent({
    required this.password,
  });
}

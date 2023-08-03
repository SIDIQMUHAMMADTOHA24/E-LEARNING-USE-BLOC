import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<UserName>(_userName);
    on<Email>(_email);
    on<Password>(_password);
    on<ConfimPassword>(_confirmPassword);
  }
  _userName(UserName event, Emitter<RegisterState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  _email(Email event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  _password(Password event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  _confirmPassword(ConfimPassword event, Emitter<RegisterState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}

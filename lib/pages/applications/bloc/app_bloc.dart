import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppState(index: event.index));
    });
  }
}

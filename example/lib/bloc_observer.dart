import 'package:bloc/bloc.dart';

/// Allows observation of all state changes in the application.
/// This lets us easily instrument our applications and track all user
/// interactions and state changes in one place.
class Observer extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}

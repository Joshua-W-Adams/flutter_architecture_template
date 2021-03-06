import 'package:flutter_clean_tdd_boilerplate/data/timer/repository_implementations/timer_repository_implementation.dart';
import 'package:flutter_clean_tdd_boilerplate/domain/timer/repository_interfaces/timer_repository_interface.dart';
import 'package:get_it/get_it.dart';
import 'data/timer/data_providers/local/ticker_local_data_provider.dart';
import 'domain/timer/blocs/timer_bloc.dart';

/// environments supported by IoC container. Allows easy swapping between mock,
/// test and live data providers.
enum Environment { production, testing, development }

final GetIt getIt = GetIt.instance;

Future<void> setupInversionOfControlContainer(Environment environment) async {
  //! Features - Timer
  // Bloc
  getIt.registerLazySingleton<TimerBloc>(
    () => TimerBloc(
      // get_it knows what class to get by using type inferance
      ticker: getIt(),
    ),
  );

  // Repository Implementations
  getIt.registerLazySingleton<TimerRepositoryInterface>(
    () => TimerRepositoryImplementation(ticker: getIt()),
  );

  // Data providers/sources
  getIt.registerLazySingleton<TickerLocalDataProvider>(
    () => TickerLocalDataProvider(),
  );

  // Assign type inferences for implementations to be used in different
  // application environments. e.g. mock auth repository in dev and firebase
  // auth in production.
  // switch (environment) {
  //   case Environment.production:
  //     // do something
  //     break;
  //   case Environment.testing:
  //     // do something else
  //     break;
  //   case Environment.development:
  //     // do something else
  //     break;
  // }
}

import 'package:flutter_clean_tdd_boilerplate/data/timer/data_providers/local/ticker_local_data_provider.dart';
import 'package:flutter_clean_tdd_boilerplate/domain/timer/repository_interfaces/timer_repository_interface.dart';

class TimerRepositoryImplementation extends TimerRepositoryInterface {
  final TickerLocalDataProvider ticker;

  TimerRepositoryImplementation({required this.ticker});

  @override
  Stream<int> tick({required int ticks}) {
    return ticker.tick(ticks: ticks);
  }
}

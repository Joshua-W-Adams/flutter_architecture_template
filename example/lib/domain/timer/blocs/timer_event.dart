part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

/// Informs the TimerBloc that the timer should be started.
class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}

/// Informs the TimerBloc that the timer should be paused.
class TimerPaused extends TimerEvent {
  const TimerPaused();
}

/// Informs the TimerBloc that the timer should be resumed.
class TimerResumed extends TimerEvent {
  const TimerResumed();
}

/// Informs the TimerBloc that the timer should be reset to the original state.
class TimerReset extends TimerEvent {
  const TimerReset();
}

/// Informs the TimerBloc that a tick has occurred and that it needs to update
/// its state accordingly.
class TimerTicked extends TimerEvent {
  const TimerTicked({required this.duration});
  final int duration;

  @override
  List<Object> get props => [duration];
}

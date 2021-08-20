part of 'timer_bloc.dart';

/// TimerState extends Equatable to optimize our code by ensuring that our app
/// does not trigger rebuilds if the same state occurs.
abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

/// Note that all of the TimerStates extend the abstract base class TimerState
/// which has a duration property. This is because no matter what state our
/// TimerBloc is in, we want to know how much time is remaining.

/// Ready to start counting down from the specified duration.
class TimerInitial extends TimerState {
  const TimerInitial(int duration) : super(duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

/// Paused at some remaining duration.
class TimerRunPause extends TimerState {
  const TimerRunPause(int duration) : super(duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

/// Actively counting down from the specified duration.
class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(int duration) : super(duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

/// Completed with a remaining duration of 0.
class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}

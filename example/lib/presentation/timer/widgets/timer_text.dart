import 'package:flutter/material.dart';
import 'package:flutter_clean_tdd_boilerplate/domain/timer/blocs/timer_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO - Why is this updating the view when it is not in a BLoC builder?
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

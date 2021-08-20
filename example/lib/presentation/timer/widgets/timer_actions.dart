import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_tdd_boilerplate/domain/timer/blocs/timer_bloc.dart';

class TimerActions extends StatelessWidget {
  const TimerActions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // BlocBuilder should only wrap widgets that need to be rebuilt in response
    // to state changes. Avoid unnecessarily wrapping widgets that don't need to
    // be rebuilt when a state changes.
    return BlocBuilder<TimerBloc, TimerState>(
      // buildWhen: In this case, we don’t want the Actions widget to be rebuilt
      // on every tick because that would be inefficient
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context
                    .read<TimerBloc>()
                    .add(TimerStarted(duration: state.duration)),
              ),
            ],
            if (state is TimerRunInProgress) ...[
              FloatingActionButton(
                child: Icon(Icons.pause),
                onPressed: () => context.read<TimerBloc>().add(TimerPaused()),
              ),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ],
            if (state is TimerRunPause) ...[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context.read<TimerBloc>().add(TimerResumed()),
              ),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ],
            if (state is TimerRunComplete) ...[
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ]
          ],
        );
      },
    );
  }
}

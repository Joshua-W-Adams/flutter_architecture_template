import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_tdd_boilerplate/domain/timer/blocs/timer_bloc.dart';
import 'package:flutter_clean_tdd_boilerplate/ioc_container.dart';
import 'package:flutter_clean_tdd_boilerplate/presentation/timer/widgets/timer_background.dart';
import 'package:flutter_clean_tdd_boilerplate/presentation/timer/widgets/timer_actions.dart';
import 'package:flutter_clean_tdd_boilerplate/presentation/timer/widgets/timer_text.dart';

/// Page widgets are responsible for:
/// "Creating a BLoC and providing it to the View."
///
/// It's important to separate or decouple the creation of a BLoC from the
/// consumption of a BLoC in order to have code that is much more testable and
/// reusable. This will allow you to easily inject mock instances and test your
/// view in isolation.
class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TimerBloc>(),
      child: const TimerView(),
    );
  }
}

/// The View is responisble for:
/// "consuming the state and interacting with the BLoC"
class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Timer')),
      body: Stack(
        children: [
          const Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              TimerActions(),
            ],
          ),
        ],
      ),
    );
  }
}

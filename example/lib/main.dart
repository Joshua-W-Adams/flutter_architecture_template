import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_clean_tdd_boilerplate/ioc_container.dart';
import 'presentation/app.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer = Observer();
  setupInversionOfControlContainer(Environment.production);
  runApp(const App());
}

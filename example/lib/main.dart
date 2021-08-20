import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'presentation/app.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer = Observer();
  runApp(const App());
}

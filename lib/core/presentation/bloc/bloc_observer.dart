import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('change: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('closed: $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('created: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('error: $bloc => $error - $stackTrace');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('event: $bloc => $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('transition: $bloc => $transition');
  }
}

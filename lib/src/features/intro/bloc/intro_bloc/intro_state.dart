part of 'intro_cubit.dart';

@immutable
abstract class IntroState {}

class IntroInitState extends IntroState {}

class IntroLoading extends IntroState {}

class IntroSuccess extends IntroState {
  final String? message;
  final int? router;
  IntroSuccess({this.message, this.router});
}

class IntroError extends IntroState {
  final String? error;
  IntroError({this.error});
}

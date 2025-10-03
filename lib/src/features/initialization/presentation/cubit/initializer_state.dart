part of 'initializer_cubit.dart';

@immutable
sealed class InitializerState {}

final class Initializing extends InitializerState {}

final class InitializationFailed extends InitializerState {
  final String message;

  InitializationFailed({required this.message});
}

final class Initialized extends InitializerState {}

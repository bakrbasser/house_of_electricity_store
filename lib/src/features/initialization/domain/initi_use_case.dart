import 'package:house_of_electricity/src/features/initialization/initializer.dart';

class InitUseCase {
  final Initializer _initializer;

  InitUseCase({required Initializer initializer}) : _initializer = initializer;

  Future<void> call() {
    return _initializer.init();
  }
}

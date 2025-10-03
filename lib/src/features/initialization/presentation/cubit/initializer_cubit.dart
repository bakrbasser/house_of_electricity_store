import 'package:bloc/bloc.dart';
import 'package:house_of_electricity/src/features/initialization/domain/initi_use_case.dart';
import 'package:meta/meta.dart';

part 'initializer_state.dart';

class InitializerCubit extends Cubit<InitializerState> {
  InitializerCubit(this._initiUseCase) : super(Initializing());
  final InitUseCase _initiUseCase;
  Future<void> init() async {
    try {
      await _initiUseCase.call();
      emit(Initialized());
    } catch (e) {
      emit(InitializationFailed(message: e.toString()));
    }
  }
}

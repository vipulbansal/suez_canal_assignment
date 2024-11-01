import 'package:flutter_bloc/flutter_bloc.dart';

enum BlocProcessState { busy, idle }

abstract class BlocWithState<E, S> extends Bloc<E, S> {
  BlocWithState(super.initialState);

  BlocProcessState _state = BlocProcessState.idle;

  BlocProcessState get blocProcessState => _state;

  Future<void> runBlocProcess(Future Function() process) async {
    if (_state == BlocProcessState.idle) {
      _state = BlocProcessState.busy;
      await process();
      _state = BlocProcessState.idle;
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(ConnectivityStateInitial()) {
    on<CheckConnectionEvent>(_checkConnecton);
  }

  _checkConnecton(
      ConnectivityEvent event, Emitter<ConnectivityState> emit) async {
    var result = await Connectivity().checkConnectivity();
    try {
      if (result != ConnectivityResult.none) {
        emit(ConnectivityStateSuccessed());
      } else {
        emit(ConnectivityStateFailed());
      }
    } catch (e) {
      print(e);
    }
  }
}

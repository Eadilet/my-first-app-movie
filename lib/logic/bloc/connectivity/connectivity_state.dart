part of 'connectivity_bloc.dart';

abstract class ConnectivityState {}

class ConnectivityStateInitial extends ConnectivityState {}

class ConnectivityStateSuccessed extends ConnectivityState {}

class ConnectivityStateFailed extends ConnectivityState {}

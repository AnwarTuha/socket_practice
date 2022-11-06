part of 'online_bloc.dart';

abstract class OnlineState extends Equatable {
  const OnlineState();

  @override
  List<Object> get props => [];
}

class OnlineInitial extends OnlineState {}

class OnlineConnectingState extends OnlineState {
  const OnlineConnectingState();
}

class OnlineConnectedState extends OnlineState {
  const OnlineConnectedState();
}

class OnlineConnectErrorState extends OnlineState {
  final dynamic data;
  const OnlineConnectErrorState(this.data);
}

class OnlineConnectTimeoutState extends OnlineState {
  final dynamic data;
  const OnlineConnectTimeoutState(this.data);
}

class OnlineDisconnectedState extends OnlineState {
  const OnlineDisconnectedState();
}

class OnlineErrorState extends OnlineState {
  final dynamic data;
  const OnlineErrorState(this.data);
}

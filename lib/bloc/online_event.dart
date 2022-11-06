part of 'online_bloc.dart';

abstract class OnlineEvent extends Equatable {
  const OnlineEvent();

  @override
  List<Object> get props => [];
}

class OnlineConnectingEvent extends OnlineEvent {}

class OnlineConnectedEvent extends OnlineEvent {}

class OnlineConnectErrorEvent extends OnlineEvent {
  const OnlineConnectErrorEvent(dynamic data);
}

class OnlineConnectTimeoutEvent extends OnlineEvent {
  const OnlineConnectTimeoutEvent(dynamic data);
}

class OnlineDisconnectEvent extends OnlineEvent {}

class OnlineErrorEvent extends OnlineEvent {
  const OnlineErrorEvent(dynamic data);
}

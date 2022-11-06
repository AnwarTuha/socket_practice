import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'online_event.dart';
part 'online_state.dart';

class OnlineBloc extends Bloc<OnlineEvent, OnlineState> {
  late final Socket _socket;
  OnlineBloc() : super(OnlineInitial()) {
    /// INITIALIZE SOCKET
    print('_______ CREATING SOCKET _________');
    _socket = io(
      'http://192.168.0.105:3211/socket.io',
      OptionBuilder()
          .setTransports(['websocket'])
          .setTimeout(3000)
          .disableAutoConnect()
          .disableReconnection()
          .build(),
    );
    _socket.connect();
    print('_______ SOCKET CREATED _________');
    _socket.onConnecting((data) => add(OnlineConnectingEvent()));
    _socket.onConnect((data) => add(OnlineConnectedEvent()));
    _socket.onConnectError((data) => add(OnlineConnectErrorEvent(data)));
    _socket.onConnectTimeout((data) => add(OnlineConnectTimeoutEvent(data)));
    _socket.onDisconnect((data) => add(OnlineDisconnectEvent()));
    _socket.onError((data) => add(OnlineErrorEvent(data)));
    _socket.on('message_connection', (data) => print(data));
    _socket.emit('message_accept', 'HELLO FROM ANWAR ');
    _socket.on('message_verify', (data) => print(data));
    _socket.emit('join', '@ANWAR');
    _socket.emit('Room@ANWAR', 'This is Anwar');
    _socket.on('message_to_room', (data) => print(data));

    on<OnlineConnectingEvent>((event, emit) {
      emit(const OnlineConnectingState());
    });

    on<OnlineConnectedEvent>((event, emit) {
      emit(const OnlineConnectedState());
    });

    on<OnlineDisconnectEvent>((event, emit) {
      emit(const OnlineDisconnectedState());
    });
  }

  @override
  Future<void> close() {
    _socket.dispose();
    return super.close();
  }
}

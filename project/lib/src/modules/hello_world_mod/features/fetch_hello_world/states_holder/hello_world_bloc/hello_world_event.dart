part of 'hello_world_bloc.dart';

sealed class HelloWorldEvent extends Equatable {
  const HelloWorldEvent();

  @override
  List<Object> get props => [];
}

class ReceiveHelloWorldFromSystemEvent extends HelloWorldEvent {}

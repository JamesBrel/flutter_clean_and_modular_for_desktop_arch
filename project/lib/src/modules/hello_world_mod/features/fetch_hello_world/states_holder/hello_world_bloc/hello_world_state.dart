part of 'hello_world_bloc.dart';

sealed class HelloWorldState extends Equatable {
  const HelloWorldState();

  @override
  List<Object> get props => [];
}

final class HelloWorldInitial extends HelloWorldState {}

class HelloWorldReceiveSuccess extends HelloWorldState {
  final String greetTheWorld;

  const HelloWorldReceiveSuccess({
    required this.greetTheWorld,
  });

  @override
  List<Object> get props => [greetTheWorld];
}

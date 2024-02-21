import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/usecases/system_say_hello_world_usecase.dart';

part 'hello_world_event.dart';
part 'hello_world_state.dart';

@injectable
class HelloWorldBloc extends Bloc<HelloWorldEvent, HelloWorldState> {
  final SystemSayHelloWorldUsecase systemSayHelloWorldUsecase;

  HelloWorldBloc({required this.systemSayHelloWorldUsecase})
      : super(HelloWorldInitial()) {
    on<ReceiveHelloWorldFromSystemEvent>((event, emit) {
      Result<String, void> _result = systemSayHelloWorldUsecase.call();
      _result.whenSuccess(
          (success) => emit(HelloWorldReceiveSuccess(greetTheWorld: success)));
    });
  }
}

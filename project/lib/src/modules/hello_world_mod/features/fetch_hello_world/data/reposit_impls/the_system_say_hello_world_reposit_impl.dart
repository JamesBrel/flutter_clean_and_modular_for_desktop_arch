import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/reposit_absts/the_system_say_hello_world_reposit_abst.dart';
import '../local_source/absts/say_the_hello_world_abst.dart';

@LazySingleton(as: TheSystemSayHelloWorldRepositAbst)
class TheSystemSayHelloWorldRepositImpl
    implements TheSystemSayHelloWorldRepositAbst {
  final SayTheHelloWorldAbst _sayTheHelloWorldAbst;

  TheSystemSayHelloWorldRepositImpl({
    required SayTheHelloWorldAbst sayTheHelloWorldAbst,
  }) : _sayTheHelloWorldAbst = sayTheHelloWorldAbst;

  @override
  Result<String, void> systemSayHelloWorld() {
    var _helloWorld = _sayTheHelloWorldAbst.sayHelloWorld();
    return Result.success(_helloWorld);
  }
}

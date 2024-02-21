import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../reposit_absts/the_system_say_hello_world_reposit_abst.dart';

@lazySingleton
class SystemSayHelloWorldUsecase {
  final TheSystemSayHelloWorldRepositAbst _theSystemSayHelloWorldRepositAbst;

  SystemSayHelloWorldUsecase({
    required TheSystemSayHelloWorldRepositAbst
        theSystemSayHelloWorldRepositAbst,
  }) : _theSystemSayHelloWorldRepositAbst = theSystemSayHelloWorldRepositAbst;

  Result<String, void> call() =>
      _theSystemSayHelloWorldRepositAbst.systemSayHelloWorld();
}

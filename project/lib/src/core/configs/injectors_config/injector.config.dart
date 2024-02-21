// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../modules/hello_world_mod/features/fetch_hello_world/data/local_source/absts/say_the_hello_world_abst.dart'
    as _i3;
import '../../../modules/hello_world_mod/features/fetch_hello_world/data/local_source/impls/say_the_hello_world_impl.dart'
    as _i4;
import '../../../modules/hello_world_mod/features/fetch_hello_world/data/reposit_impls/the_system_say_hello_world_reposit_impl.dart'
    as _i6;
import '../../../modules/hello_world_mod/features/fetch_hello_world/domain/reposit_absts/the_system_say_hello_world_reposit_abst.dart'
    as _i5;
import '../../../modules/hello_world_mod/features/fetch_hello_world/domain/usecases/system_say_hello_world_usecase.dart'
    as _i7;
import '../../../modules/hello_world_mod/features/fetch_hello_world/states_holder/hello_world_bloc/hello_world_bloc.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.SayTheHelloWorldAbst>(
        () => _i4.SayTheHelloWorldImpl());
    gh.lazySingleton<_i5.TheSystemSayHelloWorldRepositAbst>(() =>
        _i6.TheSystemSayHelloWorldRepositImpl(
            sayTheHelloWorldAbst: gh<_i3.SayTheHelloWorldAbst>()));
    gh.lazySingleton<_i7.SystemSayHelloWorldUsecase>(() =>
        _i7.SystemSayHelloWorldUsecase(
            theSystemSayHelloWorldRepositAbst:
                gh<_i5.TheSystemSayHelloWorldRepositAbst>()));
    gh.factory<_i8.HelloWorldBloc>(() => _i8.HelloWorldBloc(
        systemSayHelloWorldUsecase: gh<_i7.SystemSayHelloWorldUsecase>()));
    return this;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:exam_app/features/auth/login/domain/repositories/login_repository_contract.dart'
    as _i628;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/network/dio_module.dart' as _i673;
import '../../features/auth/login/apis/api_client/login_api_client.dart'
    as _i934;
import '../../features/auth/login/apis/login_datasource_impl/login_remote_datasorce_impl.dart'
    as _i445;
import '../../features/auth/login/data/datasources/Remote/login_remote_datasource_contract.dart'
    as _i660;
import '../../features/auth/login/data/repositories/login_repo_impl.dart'
    as _i453;

import '../../features/auth/login/domain/usecases/login_usecase.dart' as _i401;
import '../../features/auth/login/presentation/cubit/login_screen_cubit.dart'
    as _i594;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i934.LoginApiClient>(
      () => _i934.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i660.LoginRemoteDatasourceContract>(
      () => _i445.LoginRemoteDatasorceImpl(gh<_i934.LoginApiClient>()),
    );
    gh.factory<_i628.LoginRepositoryContract>(
      () => _i453.LoginRepoImpl(gh<_i660.LoginRemoteDatasourceContract>()),
    );
    gh.factory<_i401.LoginUsecase>(
      () => _i401.LoginUsecase(gh<_i628.LoginRepositoryContract>()),
    );
    gh.factory<_i594.LoginScreenCubit>(
      () => _i594.LoginScreenCubit(gh<_i401.LoginUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i673.DioModule {}

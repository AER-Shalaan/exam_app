// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/network/dio_module.dart' as _i673;
import '../../features/auth/Apis/api_client/login_api_client.dart' as _i63;
import '../../features/auth/Apis/login_datasors_iplm/login_remote_datasorce_impl.dart'
    as _i798;
import '../../features/auth/data/datasources/Remote/login_remote_datasource_contract.dart'
    as _i978;
import '../../features/auth/data/repositories/login_repo_impl.dart' as _i886;
import '../../features/auth/presentation/cubit/login_screen_cubit.dart'
    as _i160;
import '../../features/login_screen/domain/usecases/login_usecase.dart'
    as _i388;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i63.LoginApiClient>(
      () => _i63.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i978.LoginRemoteDatasourceContract>(
      () => _i798.LoginRemoteDatasorceImpl(gh<_i63.LoginApiClient>()),
    );
    gh.factory<_i388.GetUserusecase>(
      () => _i388.GetUserusecase(gh<_i978.LoginRemoteDatasourceContract>()),
    );
    gh.factory<_i160.GetUserCubit>(
      () => _i160.GetUserCubit(gh<_i388.GetUserusecase>()),
    );
    gh.factory<_i886.LoginRepoImpl>(
      () => _i886.LoginRepoImpl(gh<_i978.LoginRemoteDatasourceContract>()),
    );
    return this;
  }
}

class _$DioModule extends _i673.DioModule {}

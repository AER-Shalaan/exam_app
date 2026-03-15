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
import '../../features/auth/sign_up/apis/sign_up_api_client/sign_up_api_client.dart'
    as _i844;
import '../../features/auth/sign_up/apis/sign_up_datasorce_impl/sign_up_remote_datasorce_impl.dart'
    as _i455;
import '../../features/auth/sign_up/data/datasources/remote/sign_up_remote_datasource_contract.dart'
    as _i791;
import '../../features/auth/sign_up/data/repositories/sign_up_repo_impl.dart'
    as _i197;
import '../../features/auth/sign_up/domain/repositories/sign_up_repo_contract.dart'
    as _i496;
import '../../features/auth/sign_up/domain/usecases/sign_up_usecase.dart'
    as _i662;
import '../../features/auth/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i809;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i844.SignUpApiClient>(
      () => _i844.SignUpApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i791.SignUpRemoteDatasourceContract>(
      () => _i455.SignUpRemoteDatasorceImpl(gh<_i844.SignUpApiClient>()),
    );
    gh.factory<_i496.SignUpRepoContract>(
      () => _i197.SignUpRepoImpl(gh<_i791.SignUpRemoteDatasourceContract>()),
    );
    gh.factory<_i662.SetUserusecase>(
      () => _i662.SetUserusecase(gh<_i496.SignUpRepoContract>()),
    );
    gh.factory<_i809.SignUpCubit>(
      () => _i809.SignUpCubit(gh<_i662.SetUserusecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i673.DioModule {}

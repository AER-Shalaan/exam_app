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
import '../../feature/sign_up/apis/sign_up_api_client/sign_up_api_client.dart'
    as _i252;
import '../../feature/sign_up/apis/sign_up_datasorce_impl/sign_up_remote_datasorce_impl.dart'
    as _i963;
import '../../feature/sign_up/data/datasources/remote/sign_up_remote_datasource_contract.dart'
    as _i268;
import '../../feature/sign_up/data/repositories/sign_up_repo_impl.dart'
    as _i917;
import '../../feature/sign_up/domain/repositories/sign_up_repo_contract.dart'
    as _i286;
import '../../feature/sign_up/domain/usecases/sign_up_usecase.dart' as _i758;
import '../../feature/sign_up/presentation/cubit/sign_up_cubit.dart' as _i906;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i252.SignUpApiClient>(
      () => _i252.SignUpApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i268.SignUpRemoteDatasourceContract>(
      () => _i963.SignUpRemoteDatasorceImpl(gh<_i252.SignUpApiClient>()),
    );
    gh.factory<_i758.SetUserusecase>(
      () => _i758.SetUserusecase(gh<_i268.SignUpRemoteDatasourceContract>()),
    );
    gh.factory<_i286.SignUpRepoContract>(
      () => _i917.SignUpRepoImpl(gh<_i268.SignUpRemoteDatasourceContract>()),
    );
    gh.factory<_i906.SetUserCubit>(
      () => _i906.SetUserCubit(gh<_i758.SetUserusecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i673.DioModule {}

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
import '../../features/auth/forget_password/api/api_client/forget_password_api_client.dart'
    as _i478;
import '../../features/auth/forget_password/api/data_sources_impl/forget_password_remote_data_source_impl.dart'
    as _i47;
import '../../features/auth/forget_password/data/data_sources_contract/forget_password_data_source_contract.dart'
    as _i413;
import '../../features/auth/forget_password/data/repositories_impl/forget_password_repo_impl.dart'
    as _i656;
import '../../features/auth/forget_password/domain/repositories_contract/forget_password_repo_contract.dart'
    as _i193;
import '../../features/auth/forget_password/domain/use_cases/reset_password_use_case.dart'
    as _i22;
import '../../features/auth/forget_password/domain/use_cases/send_email_use_case.dart'
    as _i779;
import '../../features/auth/forget_password/domain/use_cases/verify_otp_use_case.dart'
    as _i722;
import '../../features/auth/forget_password/presentation/cubit/forget_password_view_model.dart'
    as _i759;
import '../../features/auth/login/apis/api_client/login_api_client.dart'
    as _i934;
import '../../features/auth/login/apis/login_datasource_impl/login_remote_datasorce_impl.dart'
    as _i445;
import '../../features/auth/login/data/datasources/Remote/login_remote_datasource_contract.dart'
    as _i660;
import '../../features/auth/login/data/repositories/login_repo_impl.dart'
    as _i453;
import '../../features/auth/login/domain/repositories/login_repository_contract.dart'
    as _i1046;
import '../../features/auth/login/domain/usecases/login_usecase.dart' as _i401;
import '../../features/auth/login/presentation/cubit/login_view_model.dart'
    as _i465;
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
import '../../features/home/api/api_client/home_api_client.dart' as _i592;
import '../../features/home/api/data_sources_impl/home_data_sources_impl.dart'
    as _i9;
import '../../features/home/data/data_sources_contract/home_data_sources_contract.dart'
    as _i478;
import '../../features/home/data/repositories_impl/home_repositories_impl.dart'
    as _i650;
import '../../features/home/domain/repositories_contract/home_repositories_contract.dart'
    as _i23;
import '../../features/home/domain/use_cases/get_all_subjects_use_case.dart'
    as _i605;
import '../../features/home/presentation/cubit/home_view_model.dart' as _i174;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i478.ForgetPasswordApiClient>(
      () => _i478.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i844.SignUpApiClient>(
      () => _i844.SignUpApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i934.LoginApiClient>(
      () => _i934.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i592.HomeApiClient>(() => _i592.HomeApiClient(gh<_i361.Dio>()));
    gh.factory<_i478.HomeDataSourcesContract>(
      () => _i9.HomeDataSourcesImpl(gh<_i592.HomeApiClient>()),
    );
    gh.factory<_i413.ForgetPasswordDataSourceContract>(
      () => _i47.ForgetPasswordRemoteDataSourceImpl(
        gh<_i478.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i791.SignUpRemoteDatasourceContract>(
      () => _i455.SignUpRemoteDatasorceImpl(gh<_i844.SignUpApiClient>()),
    );
    gh.factory<_i660.LoginRemoteDatasourceContract>(
      () => _i445.LoginRemoteDatasorceImpl(gh<_i934.LoginApiClient>()),
    );
    gh.factory<_i496.SignUpRepoContract>(
      () => _i197.SignUpRepoImpl(gh<_i791.SignUpRemoteDatasourceContract>()),
    );
    gh.factory<_i193.ForgetPasswordRepositoryContract>(
      () => _i656.ForgetPasswordRepoImpl(
        gh<_i413.ForgetPasswordDataSourceContract>(),
      ),
    );
    gh.factory<_i1046.LoginRepositoryContract>(
      () => _i453.LoginRepoImpl(gh<_i660.LoginRemoteDatasourceContract>()),
    );
    gh.factory<_i401.LoginUsecase>(
      () => _i401.LoginUsecase(gh<_i1046.LoginRepositoryContract>()),
    );
    gh.factory<_i23.HomeRepositoriesContract>(
      () => _i650.HomeRepositoriesImpl(gh<_i478.HomeDataSourcesContract>()),
    );
    gh.factory<_i722.VerifyOtpUseCase>(
      () =>
          _i722.VerifyOtpUseCase(gh<_i193.ForgetPasswordRepositoryContract>()),
    );
    gh.factory<_i662.SetUserusecase>(
      () => _i662.SetUserusecase(gh<_i496.SignUpRepoContract>()),
    );
    gh.factory<_i22.ResetPasswordUseCase>(
      () => _i22.ResetPasswordUseCase(
        gh<_i193.ForgetPasswordRepositoryContract>(),
      ),
    );
    gh.factory<_i779.SendEmailUseCase>(
      () =>
          _i779.SendEmailUseCase(gh<_i193.ForgetPasswordRepositoryContract>()),
    );
    gh.factory<_i605.GetAllSubjectsUseCase>(
      () => _i605.GetAllSubjectsUseCase(gh<_i23.HomeRepositoriesContract>()),
    );
    gh.lazySingleton<_i174.HomeViewModel>(
      () => _i174.HomeViewModel(gh<_i605.GetAllSubjectsUseCase>()),
    );
    gh.factory<_i465.LoginViewModel>(
      () => _i465.LoginViewModel(gh<_i401.LoginUsecase>()),
    );
    gh.factory<_i759.ForgetPasswordViewModel>(
      () => _i759.ForgetPasswordViewModel(
        gh<_i779.SendEmailUseCase>(),
        gh<_i722.VerifyOtpUseCase>(),
        gh<_i22.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i809.SignUpCubit>(
      () => _i809.SignUpCubit(gh<_i662.SetUserusecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i673.DioModule {}

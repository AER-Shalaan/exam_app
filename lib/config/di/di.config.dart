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
import '../../features/Auth/forget_password/api/api_client/forget_password_api_client.dart'
    as _i361;
import '../../features/Auth/forget_password/api/data_sources_impl/forget_password_data_source_impl.dart'
    as _i456;
import '../../features/Auth/forget_password/data/data_sources_contract/forget_password_data_source_contract.dart'
    as _i707;
import '../../features/Auth/forget_password/data/repositories_impl/forget_password_repo_impl.dart'
    as _i782;
import '../../features/Auth/forget_password/domain/repositories_contract/forget_password_repo_contract.dart'
    as _i849;
import '../../features/Auth/forget_password/domain/use_cases/send_email_use_case.dart'
    as _i821;
import '../../features/Auth/forget_password/domain/use_cases/verify_otp_use_case.dart'
    as _i398;
import '../../features/Auth/forget_password/presentation/cubit/forget_password_view_model.dart'
    as _i205;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i361.ForgetPasswordApiClient>(
      () => _i361.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i707.ForgetPasswordDataSourceContract>(
      () => _i456.ForgetPasswordDataSourceImpl(
        gh<_i361.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i849.ForgetPasswordRepositoryContract>(
      () => _i782.ForgetPasswordRepoImpl(
        gh<_i707.ForgetPasswordDataSourceContract>(),
      ),
    );
    gh.factory<_i398.VerifyOtpUseCase>(
      () =>
          _i398.VerifyOtpUseCase(gh<_i849.ForgetPasswordRepositoryContract>()),
    );
    gh.factory<_i821.SendEmailUseCase>(
      () =>
          _i821.SendEmailUseCase(gh<_i849.ForgetPasswordRepositoryContract>()),
    );
    gh.factory<_i205.ForgetPasswordViewModel>(
      () => _i205.ForgetPasswordViewModel(
        gh<_i821.SendEmailUseCase>(),
        gh<_i398.VerifyOtpUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i673.DioModule {}

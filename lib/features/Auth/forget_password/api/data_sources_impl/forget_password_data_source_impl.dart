import 'package:exam_app/core/network/base_response.dart';
import 'package:exam_app/features/Auth/forget_password/api/api_client/forget_password_api_client.dart';
import 'package:exam_app/features/Auth/forget_password/data/data_sources_contract/forget_password_data_source_contract.dart';
import 'package:exam_app/features/Auth/forget_password/data/models/forget_password_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordDataSourceContract)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSourceContract {
  ForgetPasswordDataSourceImpl(this.forgetPasswordApiClient);

  final ForgetPasswordApiClient forgetPasswordApiClient;
  @override
  Future<BaseResponse<ForgetPasswordModel>> sendEmail({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await forgetPasswordApiClient.sendEmail(body: body);
      return SuccessBaseResponse<ForgetPasswordModel>(data: response);
    } on Exception catch (e) {
      return ErrorBaseResponse<ForgetPasswordModel>(exception: e);
    }
  }
}

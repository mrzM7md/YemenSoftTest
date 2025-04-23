import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import 'package:yemen_soft_test/core/methods/connection_methods.dart';
import 'package:yemen_soft_test/core/network/server/api_constance.dart';
import 'package:yemen_soft_test/features/login/data/models/login_response_model.dart';
import 'package:yemen_soft_test/features/login/data/models/user_login_model.dart';

import '../../../../core/data/models/error_model.dart';
import '../../../../core/data/models/success_model.dart';
import '../../../../generated/l10n.dart';
import '../login_logic/base_login_logic.dart';
import 'base_login_methods.dart';

class LoginMethods implements BaseLoginMethods {
  @override
  final BaseLoginLogic baseLoginLogic;

  final BuildContext context;
  @override
  LoginMethods({
    required this.baseLoginLogic,
    required this.context,
  });


  @override
  Future<Either<ErrorModel, SuccessModel<LoginResponseModel>>> login({required UserLoginModel user}) async {
    try {
      if(! await isThereInternetConnectionOrDataInsideInternetConnection()){
        return Left(
          ErrorModel(message:  S.of(context).check_internet_network_connection, statusCode: 500),
        );
      }

      Response response = await ApiConstance.postData(url: ApiConstance.loginLink, data: user.toJson());
      dynamic jsonData = jsonDecode(response.body);

      if(response.statusCode >= 200 && response.statusCode < 300) {
        LoginResponseModel categoryModel = LoginResponseModel.fromJson(jsonData['Data']);

        if(jsonData["Result"]["ErrNo"] == 0){
          SuccessModel<LoginResponseModel> successModel = SuccessModel<LoginResponseModel>(statusCode: response.statusCode, message:  S.of(context).login_has_been_successfully, data: categoryModel);
          return Right(successModel);
        }
        return Left(
          ErrorModel(message: S.of(context).username_or_pass_not_correct, statusCode: 404),
        );
      }
      return Left(
        ErrorModel(message:  S.of(context).an_error_occurs, statusCode: 401),
      );

    } on Exception catch (e) {
      return Left(
        ErrorModel(message:  S.of(context).an_error_occurs, statusCode: 500),
      );
    }
  }


}
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yemen_soft_test/features/login/data/models/login_response_model.dart';
import 'package:yemen_soft_test/features/login/data/models/user_login_model.dart';

import '../../../../core/data/models/error_model.dart';
import '../../../../core/data/models/success_model.dart';
import '../login_logic/base_login_logic.dart';

abstract class BaseLoginMethods {
  Future<Either<ErrorModel, SuccessModel<LoginResponseModel>>> login({required UserLoginModel user});

  final BaseLoginLogic baseLoginLogic;
  BaseLoginMethods({required this.baseLoginLogic, required BuildContext context});
}
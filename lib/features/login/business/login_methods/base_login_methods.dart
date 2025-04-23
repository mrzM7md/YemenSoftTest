import 'package:fpdart/fpdart.dart';

import '../../../../core/data/models/error_model.dart';
import '../../../../core/data/models/success_model.dart';
import '../login_logic/base_login_logic.dart';

abstract class BaseLoginMethods {

  // Future<Either<ErrorModel, SuccessModel<String?>>> login({required String username, required String password});

  BaseLoginMethods({required BaseLoginLogic loginLogic});
}
import 'package:fpdart/fpdart.dart';

import '../../../../core/data/models/error_model.dart';
import '../../../../core/data/models/success_model.dart';
import '../app_logic/base_app_logic.dart';

abstract class BaseAppMethods {

  // Future<Either<ErrorModel, SuccessModel<String?>>> app({required String username, required String password});

  BaseAppMethods({required BaseAppLogic appLogic});
}
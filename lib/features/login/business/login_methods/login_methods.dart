import 'package:fpdart/fpdart.dart';

import '../../../../core/data/models/error_model.dart';
import '../../../../core/data/models/success_model.dart';
import '../login_logic/base_login_logic.dart';
import 'base_login_methods.dart';

class LoginMethods implements BaseLoginMethods {
  @override
  LoginMethods({required BaseLoginLogic baseLoginLogic});
  //
  // @override
  // Future<Either<ErrorModel, SuccessModel<String?>>> login({required String username, required String password}) async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: username,
  //         password: password,
  //     );
  //     return Right(SuccessModel(statusCode: 200, message: "تم تسجيل الدخول بنجاح", data: null));
  //
  //   } on FirebaseAuthException catch (e) {
  //     return Left(
  //       ErrorModel(message: "اسم المستخدم أو كلمة المرور غير صحيحة", statusCode: 401),
  //     );
  //   }
  // }
}
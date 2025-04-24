import 'package:yemen_soft_test/core/storage/locall/cache_helper.dart';
import 'package:yemen_soft_test/features/login/business/login_logic/base_login_logic.dart';

class LoginLogic implements BaseLoginLogic {
  @override
  void storeDeliverInfoOnCache({required String deliveryName, required String deliveryUsername}) {
    CacheHelper.setData(key: CacheHelper.deliveryNameKey, value: deliveryName);
    CacheHelper.setData(key: CacheHelper.deliveryUsernameKey, value: deliveryUsername);
  }
}
import 'package:yemen_soft_test/core/storage/locall/cache_helper.dart';
import 'package:yemen_soft_test/features/login/business/login_logic/base_login_logic.dart';

class LoginLogic implements BaseLoginLogic {
  @override
  void storeDeliveryNameOnCache({required String deliveryName}) {
    CacheHelper.setData(key: CacheHelper.deliveryNameKey, value: deliveryName);
  }
}
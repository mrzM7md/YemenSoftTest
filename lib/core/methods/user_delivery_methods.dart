import 'package:yemen_soft_test/core/storage/locall/cache_helper.dart';

String getDeliveryName() => CacheHelper.getString(key: CacheHelper.deliveryNameKey) ?? "--";
String getDeliveryUsername() => CacheHelper.getString(key: CacheHelper.deliveryUsernameKey) ?? "--";
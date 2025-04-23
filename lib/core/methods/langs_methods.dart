import 'package:yemen_soft_test/core/storage/locall/cache_helper.dart';

bool isRTL(){
  return CacheHelper.getString(key: CacheHelper.lanCacheKey) == 'ar';
}
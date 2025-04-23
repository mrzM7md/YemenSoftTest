import 'package:yemen_soft_test/core/storage/locall/cache_helper.dart';

bool isRTL(){
  return CacheHelper.getString(key: CacheHelper.lanCacheKey) == 'ar';
}

String getCurrentLanSymbol(){
  return CacheHelper.getString(key: CacheHelper.lanCacheKey) ?? "en";
}

int getCurrentLanNumberFromSymbol(){
  switch(getCurrentLanSymbol()){
    case "ar":
      return 1;
    default: return 2;
  }
}
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yemen_soft_test/core/routes/router.dart';
import 'package:yemen_soft_test/core/storage/locall/sqldb.dart';
import 'package:yemen_soft_test/features/business/app_methods/app_methods.dart';
import 'package:yemen_soft_test/features/business/app_state_management/app_cubit.dart';
import 'block_observer.dart';
import 'core/services/setup_service_locator.dart';
import 'core/storage/locall/cache_helper.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();

  SetupServiceLocator().init();

  sl<SqlDb>().initialDb();

  runApp(BlocProvider(
    create: (context) =>
        AppCubit(baseAppMethods: sl<AppMethods>()),
    child: BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return OnyxApp();
      },
    ),
  ));
}

class OnyxApp extends StatelessWidget {
  const OnyxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          locale: Locale(
              CacheHelper.getString(key: CacheHelper.lanCacheKey) ?? 'en'),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: ThemeData(
            fontFamily: "Montserrat",
          ),
        );
      },
    );
  }
}
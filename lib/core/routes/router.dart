import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yemen_soft_test/features/login/business/login_logic/login_logic.dart';
import 'package:yemen_soft_test/features/login/business/login_methods/login_methods.dart';
import 'package:yemen_soft_test/features/login/business/login_state_management/login_cubit.dart';
import 'package:yemen_soft_test/features/orders/business/orders_logic/orders_logic.dart';
import 'package:yemen_soft_test/features/orders/business/orders_methods/orders_methods.dart';
import 'package:yemen_soft_test/features/orders/business/orders_state_management/orders_cubit.dart';
import 'package:yemen_soft_test/features/orders/presentaion/orders_page.dart';

import '../../features/login/presentaion/login_page.dart';
import '../services/setup_service_locator.dart';

part 'router.g.dart';

// class DashboardRoute extends StatelessWidget {
//   const DashboardRoute({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           ControlPanelCubit(
//               baseControlPanelMethods: sl<ControlPanelMethods>()
//           ),
//       child: ControlPanelPage(),
//     );
//   }
// }

class LoginRoute extends StatelessWidget {
  const LoginRoute({super.key});

  @override
  Widget build(BuildContext mainContext) {
    return BlocProvider(
      create: (context) => LoginCubit(baseLoginMethods: LoginMethods(
          baseLoginLogic: LoginLogic(),
          context: mainContext
      )),
      child: LoginPage(),
    );
  }
}

class OrdersRoute extends StatelessWidget {
  const OrdersRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(baseOrdersMethods: OrdersMethods(baseOrdersLogic: OrdersLogic(), context: context)),
      child: OrdersPage(),
    );
  }
}

// This file is part of the 'router.dart' file

part of 'router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',

  routes: [
    GoRoute(
      path: LoginRoute().location,
      builder: (context, state) => LoginRouteExtension._fromState(state),
    ),

    GoRoute(
      path: OrdersRoute().location,
      builder: (context, state) => OnboardingExtension._fromState(state),
    )
  ],);

/// THIS EXTENSION IS FOR HELP YOU TO GET ANY METHODS OF EACH PAGE ROUTE


//   // Define a static method to create a DashboardRoute object from a state
//   static DashboardRoute _fromState(GoRouterState state) => DashboardRoute();
//
//   String get location => GoRouteData.$location('/',);
//
//   void go(BuildContext context) => context.go(location);
//
//   Future<T?> push<T>(BuildContext context) => context.push<T>(location);
//
//   void pushReplacement(BuildContext context) =>
//       context.pushReplacement(location);
//
//   void replace(BuildContext context) => context.replace(location);
// }


extension LoginRouteExtension on LoginRoute {
  // Define a static method to create a DashboardRoute object from a state
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  String get location => GoRouteData.$location('/login',);

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension OnboardingExtension on OrdersRoute {
  // Define a static method to create a DashboardRoute object from a state
  static OrdersRoute _fromState(GoRouterState state) => OrdersRoute();

  String get location => GoRouteData.$location('/orders',);

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

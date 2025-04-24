import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yemen_soft_test/core/enums/order_type.dart';
import 'package:yemen_soft_test/core/methods/langs_methods.dart';
import 'package:yemen_soft_test/core/methods/user_delivery_methods.dart';
import 'package:yemen_soft_test/core/values/colors.dart';
import 'package:yemen_soft_test/core/values/images.dart';
import 'package:yemen_soft_test/features/login/presentaion/dialogs/languages_dialogs.dart';
import 'package:yemen_soft_test/features/orders/business/orders_state_management/orders_cubit.dart';
import 'package:yemen_soft_test/features/orders/data/models/order_request_model.dart';
import 'package:yemen_soft_test/features/orders/presentaion/widgets/error_when_get_orders_widget.dart';
import 'package:yemen_soft_test/features/orders/presentaion/widgets/no_data_widget.dart';
import 'package:yemen_soft_test/features/orders/presentaion/widgets/order_cart_widget.dart';
import 'package:yemen_soft_test/features/orders/presentaion/widgets/profile_widget.dart';

import '../../../core/components/widgets_components.dart';
import '../../../generated/l10n.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late OrdersCubit ordersCubit;

  Timer? _inactivityTimer;
  static const int _inactivityThresholdSeconds = 30; // المدة التي سيبقى التطبيق ينتظر إذا المستخدم لم يفعل شيء

  OrderType selectedOrderType = OrderType.NEW;

  @override
  void initState() {
    super.initState();
    ordersCubit = OrdersCubit.get(context)
      ..getOrders(
          orderRequest: OrderRequestModel(
              pDLVRYNO: getDeliveryUsername(),
              pLANGNO: "${getCurrentLanNumberFromSymbol()}"));
    _startInactivityTimer();
  }

  Future<void> _reloadOrders() async {
    _startInactivityTimer(); // Reset inactivity timer on reload
    await ordersCubit.getOrders(
        orderRequest: OrderRequestModel(
            pDLVRYNO: getDeliveryUsername(),
            pLANGNO: "${getCurrentLanNumberFromSymbol()}"));
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel(); // إلغاء أي مؤقت سابق
    _inactivityTimer =
        Timer(const Duration(seconds: _inactivityThresholdSeconds), _logoutUser);
  }

  void _resetInactivityTimer() {
    _startInactivityTimer(); // إعادة تشغيل المؤقت عند أي تفاعل
  }

  void _logoutUser() {
    print('تم تسجيل خروج المستخدم بسبب عدم النشاط.');
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel(); // إلغاء المؤقت عند التخلص من الـ Widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _resetInactivityTimer,
      onPanDown: (details) => _resetInactivityTimer(),
      onScaleStart: (details) => _resetInactivityTimer(),
      child: Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: _reloadOrders,
              child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ProfileWidget(),
                      SizedBox(
                        height: 20.h,
                      ),
                      getTabBarWidget(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                          child: LayoutBuilder( // استخدم LayoutBuilder للحصول على constraints
                            builder: (BuildContext context, BoxConstraints viewportConstraints) {
                              return SingleChildScrollView( // اجعل المحتوى قابلاً للتمرير دائمًا
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: viewportConstraints.maxHeight, // اجعل الحد الأدنى لارتفاع المحتوى هو ارتفاع الشاشة
                                  ),
                                  child: BlocBuilder<OrdersCubit, OrdersState>(
                                    buildWhen: (previous, current) =>
                                    current is GetOrdersState,
                                    builder: (context, state) {
                                      if (state is! GetOrdersState || !state.isLoaded) {
                                        return getAppLoader();
                                      }
                                      if (state.isSuccess) {
                                        List orders = ordersCubit.baseOrdersMethods
                                            .baseOrdersLogic
                                            .getOrders();

                                        if(selectedOrderType == OrderType.NEW){
                                          orders = orders
                                              .where((order) => order.bILLTYPE == "1").toList();
                                        }

                                        if (orders.isEmpty) {
                                          return const NoDataWidget();
                                        }
                                        return ListView.builder(
                                          shrinkWrap: true, // مهم لجعله يعمل داخل SingleChildScrollView
                                          physics: const NeverScrollableScrollPhysics(), // منع تمرير ListView الداخلي
                                          itemCount: orders.length,
                                          itemBuilder: (context, index) {
                                            return OrderCartWidget(
                                                orderResponseModel: orders[index]);
                                          },);
                                      }
                                      return ErrorWhenGetOrdersWidget(
                                          message: state.message);
                                    },
                                  ),
                                ),
                              );
                            },
                          )),
                    ],
                  )),
            ),
          )),
    );
  }

  Widget getTabBarWidget(){
    return Container(
      width: MediaQuery.sizeOf(context).width / 1.5,
      decoration: BoxDecoration(
        color: Colors.white, // لون الخلفية الفاتح للشريط
        borderRadius: BorderRadius.circular(30), // لجعل الأطراف مستديرة
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // لون الظل مع درجة شفافية
            spreadRadius: 2, // مدى انتشار الظل
            blurRadius: 7, // مقدار الضبابية في الظل
            offset: const Offset(
                0, 3), // إزاحة الظل أفقياً وعمودياً (هنا: 0 أفقيًا، 3 للأسفل)
          ),
        ],
      ),
      padding: const EdgeInsets.all(4), // مساحة داخلية صغيرة حول الأزرار
      child: Row(
        mainAxisSize: MainAxisSize.min, // لجعل حجم Row مناسبًا للمحتوى
        children: [
          // زر "New"
          Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedOrderType = OrderType.NEW;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedOrderType == OrderType.NEW
                        ? Color(mainAppColor)
                        : Colors.transparent,
                    // لون الخلفية الداكن لزر "New" (teal)
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).new_,
                    style: TextStyle(
                      color: selectedOrderType == OrderType.NEW
                          ? Colors.white
                          : Color(mainAppColor),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
          const SizedBox(width: 8), // مسافة بين الزرين
          // زر "Others"
          Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedOrderType = OrderType.OTHERS;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedOrderType == OrderType.OTHERS
                        ? Color(mainAppColor)
                        : Colors.transparent,
                    // لون الخلفية الداكن لزر "New" (teal)
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Text(
                    textAlign: TextAlign.center,
                    S.of(context).others,
                    style: TextStyle(
                      color: selectedOrderType == OrderType.OTHERS
                          ? Colors.white
                          : Color(mainAppColor),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

}
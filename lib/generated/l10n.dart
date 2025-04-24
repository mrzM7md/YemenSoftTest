// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome back!`
  String get welcome_back {
    return Intl.message(
      'Welcome back!',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Log back into your account`
  String get log_back_into_your_account {
    return Intl.message(
      'Log back into your account',
      name: 'log_back_into_your_account',
      desc: '',
      args: [],
    );
  }

  /// `User Id`
  String get user_id {
    return Intl.message('User Id', name: 'user_id', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Log In`
  String get login {
    return Intl.message('Log In', name: 'login', desc: '', args: []);
  }

  /// `Show More`
  String get show_more {
    return Intl.message('Show More', name: 'show_more', desc: '', args: []);
  }

  /// `العربية`
  String get arabic {
    return Intl.message('العربية', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Choose Language`
  String get choose_language {
    return Intl.message(
      'Choose Language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `required`
  String get required {
    return Intl.message('required', name: 'required', desc: '', args: []);
  }

  /// `user name or password not correct`
  String get username_or_pass_not_correct {
    return Intl.message(
      'user name or password not correct',
      name: 'username_or_pass_not_correct',
      desc: '',
      args: [],
    );
  }

  /// `login has been successfully`
  String get login_has_been_successfully {
    return Intl.message(
      'login has been successfully',
      name: 'login_has_been_successfully',
      desc: '',
      args: [],
    );
  }

  /// `an error occurs`
  String get an_error_occurs {
    return Intl.message(
      'an error occurs',
      name: 'an_error_occurs',
      desc: '',
      args: [],
    );
  }

  /// `check internet network connection`
  String get check_internet_network_connection {
    return Intl.message(
      'check internet network connection',
      name: 'check_internet_network_connection',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get new_ {
    return Intl.message('New', name: 'new_', desc: '', args: []);
  }

  /// `Others`
  String get others {
    return Intl.message('Others', name: 'others', desc: '', args: []);
  }

  /// `Order Detail`
  String get order_details {
    return Intl.message(
      'Order Detail',
      name: 'order_details',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Total Price`
  String get total_price {
    return Intl.message('Total Price', name: 'total_price', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `There is no data to display`
  String get there_is_no_data_to_display {
    return Intl.message(
      'There is no data to display',
      name: 'there_is_no_data_to_display',
      desc: '',
      args: [],
    );
  }

  /// `No orders yet`
  String get no_orders_yet {
    return Intl.message(
      'No orders yet',
      name: 'no_orders_yet',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any orders in your history.`
  String get You_dont_have_any_orders_in_your_history {
    return Intl.message(
      'You don\'t have any orders in your history.',
      name: 'You_dont_have_any_orders_in_your_history',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get new_status {
    return Intl.message('New', name: 'new_status', desc: '', args: []);
  }

  /// `Delivering`
  String get on_delivering {
    return Intl.message(
      'Delivering',
      name: 'on_delivering',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message('Delivered', name: 'delivered', desc: '', args: []);
  }

  /// `Returned`
  String get returned {
    return Intl.message('Returned', name: 'returned', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

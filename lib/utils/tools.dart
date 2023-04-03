import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';

/// Authors (avour, ...)
// Set of tools for purscliq

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:path_provider/path_provider.dart' as path_provider;

const String APP_ICON = 'assets/images/ic_launcher.png';

const String APP_VERSION = '1.0.0';
const String OneSignalId = '2452c96a-106c-461f-80a3-2b4f0abd6d83';

bool isStoreInitialized = false;

const String GOOGLE_API_KEY = 'AIzaSyBlKVRsgWSGoPYB5sD_0XbOCLvVPY4u4bw';

Future<void> initializeStore() async {
  if (isStoreInitialized) {
    return;
  }

  if (!kIsWeb) {
    final Directory dir = await path_provider.getApplicationSupportDirectory();
    final String hiveFolder = join(dir.path); // , '.storage'
    Hive.init(hiveFolder);
  }
  isStoreInitialized = true;
}

/// Put an object in the store
Future<void> putInStore(String key, value, {String store = 'store'}) async {
  await initializeStore();
  Box box = await Hive.openBox(store);
  return await box.put(key, value);
}

/// Function to put an object in the store
Future<dynamic> getFromStore(String key, {String store = 'store'}) async {
  await initializeStore();
  Box box = await Hive.openBox(store);
  return await box.get(key);
}

/// Function to put an object in the store
Future<void> removeFromStore(String key, {String store = 'store'}) async {
  await initializeStore();
  Box box = await Hive.openBox(store);
  await box.delete(key);
}

Future<void> clearStore({store = 'store'}) async {
  await initializeStore();
  Box box = await Hive.openBox(store);
  await box.clear();
}

class Validators {
// Regex func for validating a name
  static String? validateName(String value) {
    if (value.isEmpty) return 'This is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) return 'Email is required.';
    final RegExp emailExp =
        RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');
    if (!emailExp.hasMatch(value.trim())) return 'Please enter a valid email';
    return null;
  }

  static String? checkFilledForm(Map<String, dynamic> value) {
    bool filled =
        (value.values.every((element) => element != null && element != ''));
    List<String> defaulters = [];
    if (!filled) {
      for (MapEntry<String, dynamic> element in value.entries) {
        if (element.value == null || element.value == '') {
          defaulters.add(element.key);
        }
      }
      debugPrint('Form Error in: $defaulters');
      return 'Please ensure the following fields are filled:\n$defaulters';
    }
    return null;
  }

  static String? validateUsername(String value) {
    if (value.isEmpty) return 'Username is required.';
    final RegExp emailExp = RegExp(r'^[\w.@+\- ]+$');
    if (!emailExp.hasMatch(value)) return 'invalid username';
    return null;
  }

  static String? isNotNull(String value) {
    return (value == null) ? 'This field is required' : null;
  }

  static String? isNotEmpty(String? value) {
    return value!.isEmpty ? 'This field is required' : null;
  }

  static String? isNotEmpty2(String value) {
    return value.isEmpty ? '' : null;
  }

  static String? isInt(String value) {
    return (int.tryParse(value) == null) ? 'Invalid Input' : null;
  }

  static String? isDouble(String value) {
    return (double.tryParse(value) == null) ? 'Invalid Input' : null;
  }

  static String? validateMobile(String? value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value!.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}

void showToast(String msg, {Duration duration = const Duration(seconds: 2)}) {
  BotToast.showText(text: msg, duration: duration);
}

void showOverlay(String msg, {Duration duration = const Duration(seconds: 2)}) {
  BotToast.showLoading();
}

bool isUrl(String path) {
  if (path.startsWith('http') && path.contains('://')) {
    return true;
  } else {
    return false;
  }
}

String? fixMessedUpPhoneNumber(String phoneNo, {countryCode = '+234'}) {
  phoneNo = phoneNo.replaceAll(RegExp(' '), '');
  if (phoneNo.startsWith('+')) {
    return phoneNo;
  }
  if (phoneNo.length == 11 || phoneNo.startsWith('0')) {
    phoneNo = phoneNo.substring(1);
  }
  return countryCode + phoneNo;
}

NumberFormat priceFormatter = NumberFormat('#,##0', 'en_US');
String formatPrice(price) {
  return priceFormatter.format(price);
}

NumberFormat currencyFormat =
    NumberFormat.currency(symbol: '\u20A6', locale: 'en_NG');
String formatPriceDetailed(price) {
  return currencyFormat.format(price);
}

String parseTime(DateTime obj) {
  return DateFormat.jm().format(obj);
}

String parseDate(DateTime obj) {
  if (obj == null) return '';
  return DateFormat.yMMMd().format(obj);
}

String parseFormDateTime(DateTime obj) {
  if (obj == null) return '';
  return DateFormat('yyyy-MM-dd').format(obj);
}

String parseAnalyticsDate(DateTime obj) {
  return DateFormat('MM/dd/yyyy').format(obj);
}

String parseDateRange(DateTimeRange range) {
  return "${DateFormat('MMMd').format(range.start)} - ${DateFormat('MMMd').format(range.end)}";
}

Future showResponseDialog(BuildContext context, String info,
    {type = 'success', actionText = 'OK', VoidCallback? onComplete}) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (BuildContext ctx) {
        return Container(
          height: 435,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: Column(
                    children: [
                      Icon(
                        (type == 'success')
                            ? Icons.check_circle
                            : Icons.cancel_rounded,
                        color: (type == 'success')
                            ? Colors.green
                            : const Color(0xFFEE3333),
                        size: 120,
                      ),
                      Text((type == 'success') ? 'Done!' : 'Error!',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontFamily: 'GilroyMedium',
                                  color: const Color.fromRGBO(0, 0, 0, 0.8))),
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(info,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontFamily: 'GilroyMedium',
                                      color: Colors.black.withAlpha(200)))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

Future<DateTime?> selectDate(BuildContext context,
    {DateTime? selectedDate, DateTime? startDate, DateTime? endDate}) async {
  DateTime start =
      startDate ?? DateTime.now().subtract(const Duration(days: 365 * 100));
  DateTime initial = selectedDate ?? DateTime.now();
  DateTime end = endDate ?? DateTime.now().add(const Duration(days: 365 * 100));

  debugPrint('Initial is: $initial');
  return showDatePicker(
    context: context,
    initialDate: initial,
    firstDate: start,
    lastDate: end,
  );
}

Future<DateTime?> selectTime(BuildContext context,
    {DateTime? selectedDate, DateTime? startDate, DateTime? endDate}) async {
  DateTime start =
      startDate ?? DateTime.now().subtract(const Duration(days: 365 * 100));
  DateTime initial = selectedDate ?? DateTime.now();
  DateTime end = endDate ?? DateTime.now().add(const Duration(days: 365 * 100));

  debugPrint('Initial is: $initial');
  return showDatePicker(
    context: context,
    initialDate: initial,
    firstDate: start,
    lastDate: end,
  );
}

Future<T?> showScaffoldBottomSheet<T>(
    {required BuildContext context,
    String? title,
    Widget? body,
    bool? headless,
    List<Widget>? actions,
    double height = 0.7}) {
  return showBaseBottomSheet<T>(
      context: context,
      height: height,
      body: Scaffold(
          backgroundColor: Colors.white,
          appBar: (headless == true)
              ? null
              : AppBar(
                  backgroundColor: Colors.white,
                  elevation: 1,
                  leading: IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.grey,
                    splashRadius: 20,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: Text(
                    title!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  actions: actions,
                ),
          body: Container(
              padding: const EdgeInsets.symmetric(vertical: 10), child: body)));
}

Future<T?> showBaseBottomSheet<T>(
    {required BuildContext context, Widget? body, double height = 0.7}) {
  return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      builder: (BuildContext context2) {
        return Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            height: MediaQuery.of(context).size.height * height,
            child: body);
      });
}

Future<T?> showWrappedContentBottomSheet<T>(
    {required BuildContext context, required Widget body}) {
  return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      builder: (BuildContext context2) {
        return Wrap(children: <Widget>[
          AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: 25,
            backgroundColor: Colors.white,
            title: Center(
              child: Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffD4D7DD)),
              ),
            ),
          ),
          body
        ]);
      });
}

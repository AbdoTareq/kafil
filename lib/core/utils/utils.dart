import 'package:kafil/core/app_router.dart';
import 'package:kafil/main.dart';

import '../../export.dart';

GlobalKey<NavigatorState> navKey = sl<AppRouter>().navigatorKey;

// methods
showWarningDialog({String? title = '', String? text = ''}) async {
  await showDialog(
      context: navKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: (title ?? '👍').tr().text.isIntrinsic.bold.xl2.makeCentered(),
          content: (text ?? 'under_dev').tr().text.isIntrinsic.bold.xl.make(),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(yes),
            ),
          ],
        );
      });
}

showSimpleDialog({String title = '', String text = ''}) async {
  await showDialog(
      context: navKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: (title.isNotEmpty ? title : '👍')
              .tr()
              .text
              .isIntrinsic
              .bold
              .xl2
              .makeCentered(),
          content: (text.isNotEmpty ? text : 'Success')
              .tr()
              .text
              .isIntrinsic
              .bold
              .xl
              .make(),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(yes),
            ),
          ],
        );
      });
}

showSuccessSnack({String title = '', String text = ''}) {
  // Get.snackbar(
  //     title.isNotEmpty ? title : '👍', text.isNotEmpty ? text : 'under_dev',
  //     snackPosition: SnackPosition.BOTTOM,
  //     duration: Duration(seconds: 6),
  //     backgroundColor: Colors.green,
  //     barBlur: 10,
  //     margin: EdgeInsets.all(10),
  //     padding: EdgeInsets.all(8));
}

showFailSnack({String title = '', String text = '', Function()? yesFunction}) {
  // Get.snackbar(
  //     title.isNotEmpty ? title : watch, text.isNotEmpty ? text : 'under_dev',
  //     snackPosition: SnackPosition.BOTTOM,
  //     duration: Duration(seconds: 15),
  //     barBlur: 10,
  //     mainButton: TextButton(
  //       onPressed: yesFunction,
  //       child: yes.tr().text.isIntrinsic.color(kPrimaryColor).bold.xl.make().p8(),
  //     ),
  //     margin: EdgeInsets.all(10),
  //     padding: EdgeInsets.all(8));
}

Future<Null> handleRequest(Future<Null> Function() asyncFunction,
    {bool showMessage = false, String? message}) async {
  showDialog(
    barrierDismissible: false,
    context: navKey.currentContext!,
    builder: (BuildContext context) {
      return const AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      );
    },
  );
  await handleError(asyncFunction);
  Navigator.pop(navKey.currentContext!);
}

Future<dynamic> handleError(Future<dynamic> Function() asyncFunction,
    {bool showMessage = false,
    String? message,
    Function(dynamic e)? onError}) async {
  try {
    return await asyncFunction();
  } catch (e) {
    logger.e(e);
    logger.e(StackTrace.current);
    if (onError != null) onError(e);
    if (e.toString().contains('Unauthenticated')) {
      showFailSnack(text: login_to_continue, yesFunction: () {});
    } else {
      List<String> messages =
          e.toString().replaceAll('}', '').split('message:');
      await showWarningDialog(
          title: message ?? 'error',
          text: messages.length > 1 ? messages[1] : messages[0]);
    }
  }
}

Widget? errorLoading(dynamic state) {
  if (state.error != null) {
    return state.error.toString().tr().text.bold.xl.makeCentered().p8();
  }
  if (state.isLoading) {
    return const ShimmerList();
  }
  return null;
}

getColorFromHex(String color) =>
    Color(int.parse(color.toString().replaceAll('#', '0xff')));

String getName(item) {
  dynamic temp = item as dynamic;
  try {
    return temp.name;
  } catch (e) {}
  try {
    return temp.title;
  } catch (e) {}
  try {
    return temp.value;
  } catch (e) {}
  try {
    return temp.id;
  } catch (e) {}
  return item.toString();
}

int? getId(item) {
  dynamic temp = item as dynamic;
  try {
    return temp.id;
  } catch (e) {}
  return null;
}

getJson(item) {
  dynamic temp = item as dynamic;
  try {
    return temp.toMap();
  } catch (e) {
    return temp.toJson();
  }
}

/// item is modelInstance that has .fromMap & doesn't has data, map is the data
T getModel<T>(modelInstance, data) {
  dynamic temp = modelInstance as dynamic;
  if (modelInstance is Map) {
    return data;
  }
  try {
    return temp.fromMap(data);
  } catch (e) {
    return temp.fromJson(data);
  }
}

bool hasMatch(String? value, String pattern) {
  return (value == null) ? false : RegExp(pattern).hasMatch(value);
}

bool isEmail(String s) => hasMatch(s,
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

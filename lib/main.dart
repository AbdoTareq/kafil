import 'package:flutter/foundation.dart';
import 'package:kafil/core/app_router.dart';
import 'package:kafil/generated/codegen_loader.g.dart';
import 'package:requests_inspector/requests_inspector.dart';

import 'core/injection_container.dart' as di;
import 'export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();

  EasyLocalization.logger.enableBuildModes = [];
  await Future.wait([GetStorage.init()]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor // status bar color
      ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(EasyLocalization(
        assetLoader: const CodegenLoader(),
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: 'assets/langs',
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        child: const RequestsInspector(
            enabled: kDebugMode,
            showInspectorOn: ShowInspectorOn.LongPress,
            child: MyApp())));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // sl<GetStorage>().erase();
    return ScreenUtilInit(
        designSize: const Size(baseWidth, baseHeight),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            theme: lightTheme,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            routerConfig: di.sl<AppRouter>().config(),
          );
        });
  }
}

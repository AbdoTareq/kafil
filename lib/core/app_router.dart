import 'package:kafil/features/auth/presentation/login/login_page.dart';
import 'package:kafil/features/auth/presentation/signup/signup_page.dart';
import 'package:kafil/features/countries/presentation/countries_page.dart';
import 'package:kafil/features/home/presentation/home_page.dart';
import 'package:kafil/features/profile/presentation/profile_page.dart';
import 'package:kafil/features/services/presentation/services_page.dart';

import '../export.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final box = sl<GetStorage>();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: !box.hasData(kUser)),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: HomeRoute.page, initial: box.hasData(kUser), children: [
          AutoRoute(page: ServicesRoute.page),
          AutoRoute(page: ProfileRoute.page),
          AutoRoute(page: CountriesRoute.page),
        ]),
      ];
}

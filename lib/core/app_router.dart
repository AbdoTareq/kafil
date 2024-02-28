import 'package:kafil/features/auth/presentation/login/login_page.dart';
import 'package:kafil/features/auth/presentation/signup/reset_pass_phone_page.dart';
import 'package:kafil/features/auth/presentation/signup/signup_page.dart';
import 'package:kafil/features/home/presentation/home_page.dart';
import 'package:kafil/features/home/presentation/year_subjects_page.dart';
import 'package:kafil/features/settings/presentation/contact_page.dart';
import 'package:kafil/features/settings/presentation/page.dart';
import 'package:kafil/features/teachers/presentation/subject_teachers_page.dart';
import 'package:kafil/features/teachers/presentation/teacher_meetings_page.dart';

import '../export.dart';
import 'feature/data/models/level_wrapper.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final box = sl<GetStorage>();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: !box.hasData(kToken)),
        AutoRoute(page: HomeRoute.page, initial: box.hasData(kToken)),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: SubjectTeachersRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: YearSubjectsRoute.page),
        AutoRoute(page: TeacherMeetingsRoute.page),
        AutoRoute(page: ResetPassPhoneRoute.page),
      ];
}

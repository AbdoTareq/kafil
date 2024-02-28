// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ContactRoute.name: (routeData) {
      final args = routeData.argsAs<ContactRouteArgs>(
          orElse: () => const ContactRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ContactPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(key: args.key),
      );
    },
    ResetPassPhoneRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPassPhoneRouteArgs>(
          orElse: () => const ResetPassPhoneRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResetPassPhonePage(
          key: args.key,
          phoneArg: args.phoneArg,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>(
          orElse: () => const SettingsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsPage(key: args.key),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignUpPage(key: args.key),
      );
    },
    SubjectTeachersRoute.name: (routeData) {
      final args = routeData.argsAs<SubjectTeachersRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SubjectTeachersPage(
          key: args.key,
          subjectId: args.subjectId,
        ),
      );
    },
    TeacherMeetingsRoute.name: (routeData) {
      final args = routeData.argsAs<TeacherMeetingsRouteArgs>(
          orElse: () => const TeacherMeetingsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TeacherMeetingsPage(key: args.key),
      );
    },
    YearSubjectsRoute.name: (routeData) {
      final args = routeData.argsAs<YearSubjectsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: YearSubjectsPage(
          key: args.key,
          year: args.year,
        ),
      );
    },
  };
}

/// generated route for
/// [ContactPage]
class ContactRoute extends PageRouteInfo<ContactRouteArgs> {
  ContactRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ContactRoute.name,
          args: ContactRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ContactRoute';

  static const PageInfo<ContactRouteArgs> page =
      PageInfo<ContactRouteArgs>(name);
}

class ContactRouteArgs {
  const ContactRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ContactRouteArgs{key: $key}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ResetPassPhonePage]
class ResetPassPhoneRoute extends PageRouteInfo<ResetPassPhoneRouteArgs> {
  ResetPassPhoneRoute({
    Key? key,
    String? phoneArg,
    List<PageRouteInfo>? children,
  }) : super(
          ResetPassPhoneRoute.name,
          args: ResetPassPhoneRouteArgs(
            key: key,
            phoneArg: phoneArg,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPassPhoneRoute';

  static const PageInfo<ResetPassPhoneRouteArgs> page =
      PageInfo<ResetPassPhoneRouteArgs>(name);
}

class ResetPassPhoneRouteArgs {
  const ResetPassPhoneRouteArgs({
    this.key,
    this.phoneArg,
  });

  final Key? key;

  final String? phoneArg;

  @override
  String toString() {
    return 'ResetPassPhoneRouteArgs{key: $key, phoneArg: $phoneArg}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<SettingsRouteArgs> page =
      PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<SignUpRouteArgs> page = PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SubjectTeachersPage]
class SubjectTeachersRoute extends PageRouteInfo<SubjectTeachersRouteArgs> {
  SubjectTeachersRoute({
    Key? key,
    required int subjectId,
    List<PageRouteInfo>? children,
  }) : super(
          SubjectTeachersRoute.name,
          args: SubjectTeachersRouteArgs(
            key: key,
            subjectId: subjectId,
          ),
          initialChildren: children,
        );

  static const String name = 'SubjectTeachersRoute';

  static const PageInfo<SubjectTeachersRouteArgs> page =
      PageInfo<SubjectTeachersRouteArgs>(name);
}

class SubjectTeachersRouteArgs {
  const SubjectTeachersRouteArgs({
    this.key,
    required this.subjectId,
  });

  final Key? key;

  final int subjectId;

  @override
  String toString() {
    return 'SubjectTeachersRouteArgs{key: $key, subjectId: $subjectId}';
  }
}

/// generated route for
/// [TeacherMeetingsPage]
class TeacherMeetingsRoute extends PageRouteInfo<TeacherMeetingsRouteArgs> {
  TeacherMeetingsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TeacherMeetingsRoute.name,
          args: TeacherMeetingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TeacherMeetingsRoute';

  static const PageInfo<TeacherMeetingsRouteArgs> page =
      PageInfo<TeacherMeetingsRouteArgs>(name);
}

class TeacherMeetingsRouteArgs {
  const TeacherMeetingsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'TeacherMeetingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [YearSubjectsPage]
class YearSubjectsRoute extends PageRouteInfo<YearSubjectsRouteArgs> {
  YearSubjectsRoute({
    Key? key,
    required Year year,
    List<PageRouteInfo>? children,
  }) : super(
          YearSubjectsRoute.name,
          args: YearSubjectsRouteArgs(
            key: key,
            year: year,
          ),
          initialChildren: children,
        );

  static const String name = 'YearSubjectsRoute';

  static const PageInfo<YearSubjectsRouteArgs> page =
      PageInfo<YearSubjectsRouteArgs>(name);
}

class YearSubjectsRouteArgs {
  const YearSubjectsRouteArgs({
    this.key,
    required this.year,
  });

  final Key? key;

  final Year year;

  @override
  String toString() {
    return 'YearSubjectsRouteArgs{key: $key, year: $year}';
  }
}

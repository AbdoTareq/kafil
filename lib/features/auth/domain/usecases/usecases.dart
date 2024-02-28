import 'package:kafil/core/feature/data/models/teacher_wrapper.dart';
import 'package:kafil/core/feature/data/models/user_wrapper.dart';
import 'package:kafil/core/feature/domain/repositories/repositories.dart';

import '../../../../export.dart';

class AuthUseCase {
  final Repository repository;

  AuthUseCase({required this.repository});

  Future<Either<Failure, UserWrapper>> login(Map user) async {
    return (repository.post('login', user)).then((value) =>
        value.map((r) => r == null ? UserWrapper() : UserWrapper.fromJson(r)));
  }

  Future<Either<Failure, TeacherWrapper>> loginTeacher(Map user) async {
    return (repository.post('teacher_login', user)).then((value) => value
        .map((r) => r == null ? TeacherWrapper() : TeacherWrapper.fromJson(r)));
  }

  Future<Either<Failure, UserWrapper>> signup(Map user) async {
    return (repository.post('register', user)).then((value) =>
        value.map((r) => r == null ? UserWrapper() : UserWrapper.fromJson(r)));
  }

  Future<Either<Failure, dynamic>> logout(String type) async {
    return (repository.post(
        type == UserType.kTeacher.name ? 'teacher_logout' : 'logout', {}));
  }

  Future<Either<Failure, dynamic>> resetPasswordCode(String phone) async {
    return (repository.post('password/phone', {"phone": phone}));
  }

  Future<Either<Failure, dynamic>> resetPassword(Map data) async {
    return (repository.post('password/reset', data));
  }

  Future<Either<Failure, Map<String, dynamic>?>> resetIdentifier(
      String deviceId) async {
    return (repository.post('reset_identifier', {'new_identifier': deviceId}));
  }

  Future<Either<Failure, Map<String, dynamic>?>> updateIdentifier(
      String code) async {
    return (repository.post('update_identifier', {'change_code': code}));
  }
}

import 'package:kafil/core/feature/data/models/user_wrapper.dart';
import 'package:kafil/core/feature/domain/repositories/repositories.dart';

import '../../../../export.dart';

class AuthUseCase {
  final Repository repository;

  AuthUseCase({required this.repository});

  Future<Either<Failure, UserWrapper>> login(Map user) async {
    return (repository.post('user/login', user)).then((value) =>
        value.map((r) => r == null ? UserWrapper() : UserWrapper.fromJson(r)));
  }

  Future<Either<Failure, UserWrapper>> signup(Map user) async {
    return (repository.post('user/register', user)).then((value) =>
        value.map((r) => r == null ? UserWrapper() : UserWrapper.fromJson(r)));
  }
}

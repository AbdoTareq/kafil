import 'package:kafil/core/feature/data/models/user_wrapper.dart';
import 'package:kafil/core/feature/domain/repositories/repositories.dart';

import '../../../../export.dart';

class ProfileUseCase {
  final Repository repository;

  ProfileUseCase({required this.repository});

  Future<Either<Failure, UserWrapper>> getUser() async {
    return (repository.get('user/who-am-i')).then((value) =>
        value.map((r) => r == null ? UserWrapper() : UserWrapper.fromJson(r)));
  }
}

import 'package:kafil/core/feature/data/models/services_wrapper.dart';
import 'package:kafil/core/feature/domain/repositories/repositories.dart';

import '../../../../export.dart';

class ServicesUseCase {
  final Repository repository;

  ServicesUseCase({required this.repository});

  Future<Either<Failure, ServicesWrapper>> getServices() async {
    return repository.get('service').then((value) => value.map(
        (r) => r == null ? ServicesWrapper() : ServicesWrapper.fromJson(r)));
  }

  Future<Either<Failure, ServicesWrapper>> getPopularServices() async {
    return repository.get('service/popular').then((value) => value.map(
        (r) => r == null ? ServicesWrapper() : ServicesWrapper.fromJson(r)));
  }
}

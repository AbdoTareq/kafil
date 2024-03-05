import 'package:kafil/core/feature/data/models/dependencies_wrapper.dart';
import 'package:kafil/core/feature/domain/repositories/repositories.dart';

import '../../../../export.dart';

class DependenciesUseCase {
  final Repository repository;

  DependenciesUseCase({required this.repository});

  Future<Either<Failure, DependenciesWrapper>> get() async {
    return (repository.get('dependencies')).then((value) => value.map((r) =>
        r == null ? DependenciesWrapper() : DependenciesWrapper.fromJson(r)));
  }
}

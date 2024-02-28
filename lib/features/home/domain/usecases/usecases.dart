import 'package:kafil/core/feature/data/models/level_wrapper.dart';
import 'package:kafil/core/feature/data/models/sliders_wrapper.dart';
import 'package:kafil/core/feature/domain/repositories/repositories.dart';

import '../../../../export.dart';

class HomeUseCase {
  final Repository repository;

  HomeUseCase({required this.repository});

  Future<Either<Failure, LevelWrapper>> getLevels() async {
    return (repository.get('levels')).then((value) => value
        .map((r) => r == null ? LevelWrapper() : LevelWrapper.fromJson(r)));
  }

  Future<Either<Failure, SlidersWrapper>> getSliders() async {
    return (repository.get('sliders')).then((value) => value
        .map((r) => r == null ? SlidersWrapper() : SlidersWrapper.fromJson(r)));
  }
}

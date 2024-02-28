import 'package:kafil/core/feature/data/models/settings_model.dart';
import 'package:kafil/core/feature/data/models/subject_teachers_wrapper.dart';
import 'package:kafil/core/feature/domain/repositories/repositories.dart';

import '../../../../export.dart';

class SettingsUseCase {
  final Repository repository;

  SettingsUseCase({required this.repository});

  Future<Either<Failure, SettingsModel>> get() async {
    return (repository.get('setting')).then((value) => value.map((r) =>
        r?['data'] == null
            ? SettingsModel()
            : SettingsModel.fromJson(r!['data'])));
  }

  Future<Either<Failure, Map<String, dynamic>?>> contact(Map data) async {
    return (repository.post('contact_us', data));
  }

  Future<Either<Failure, SubjectTeachersWrapper>> getSubjectTeachers(
      int subjectId) async {
    return (repository.get('teachers?subject_id=$subjectId')).then((value) =>
        value.map((r) => r == null
            ? SubjectTeachersWrapper()
            : SubjectTeachersWrapper.fromJson(r)));
  }
}

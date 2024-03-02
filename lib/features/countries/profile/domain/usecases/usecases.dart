import 'package:kafil/core/feature/data/models/subject_teachers_wrapper.dart';
import 'package:kafil/core/feature/data/models/teacher_detail_wrapper.dart';
import 'package:kafil/core/feature/domain/repositories/repositories.dart';
import 'package:kafil/export.dart';

class TeachersUseCase {
  final Repository repository;

  TeachersUseCase({required this.repository});

  Future<Either<Failure, TeacherDetailsWrapper>> getTeacherDetails(
      int teacherId) async {
    return (repository.get('teachers/$teacherId')).then((value) => value.map(
        (r) => r == null
            ? TeacherDetailsWrapper()
            : TeacherDetailsWrapper.fromJson(r)));
  }

  Future<Either<Failure, SubjectTeachersWrapper>> getSubjectTeachers(
      int subjectId) async {
    return (repository.get('teachers?subject_id=$subjectId')).then((value) =>
        value.map((r) => r == null
            ? SubjectTeachersWrapper()
            : SubjectTeachersWrapper.fromJson(r)));
  }

  Future<Either<Failure, Map<String, dynamic>?>> getTeacherMeetings() async {
    return (repository.get('meetings'));
  }

  Future<Either<Failure, Map<String, dynamic>?>> endMeeting(
      int meetingId) async {
    return (repository.update('zoom_meetings/$meetingId/end_meeting', {}));
  }

  Future<Either<Failure, Map<String, dynamic>?>> sendZoomNotification(
      int subjectId, String zoomId, String zoomPassword) async {
    return (repository.post('zoom_notification', {
      "subject_id": subjectId,
      "zoom_id": zoomId,
      "zoom_password": zoomPassword,
    }));
  }
}

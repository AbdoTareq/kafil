import 'package:kafil/export.dart';
import 'package:kafil/features/profile/domain/usecases/usecases.dart';

class ProfileCubit extends Cubit<BaseState<Map>> {
  final TeachersUseCase useCase;

  ProfileCubit({required this.useCase}) : super(const BaseState());

  Future get() async {
    emit(state.copyWith(status: RxStatus.Loading));
    return await handleError(() async {
      final response = await useCase.getTeacherMeetings();
      return response.fold((l) {
        emit(state.copyWith(status: RxStatus.Error, errorMessage: l.message));
        showSimpleDialog(text: l.message.toString());
      }, (r) {
        emit(state.copyWith(status: RxStatus.Success, data: r));
        return r;
      });
    });
  }

  Future endMeeting(int id) async {
    return await handleError(() async {
      final response = await useCase.endMeeting(id);
      return response.fold((l) {
        showSimpleDialog(text: l.message.toString());
      }, (r) {
        showSimpleDialog(text: r.toString());
        return r;
      });
    });
  }

  Future sendZoomNotification(
      int subjectId, String zoomId, String zoomPassword) async {
    return await handleError(() async {
      final response =
          await useCase.sendZoomNotification(subjectId, zoomId, zoomPassword);
      return response.fold((l) {
        showSimpleDialog(text: l.message.toString());
      }, (r) {
        showSimpleDialog(text: r.toString());
        return r;
      });
    });
  }
}

import 'package:kafil/core/feature/data/models/subject_teachers_wrapper.dart';
import 'package:kafil/export.dart';
import 'package:kafil/features/teachers/domain/usecases/usecases.dart';

class SubjectTeachersCubit extends Cubit<BaseState<List<SubjectTeacherModel>>> {
  final TeachersUseCase useCase;

  SubjectTeachersCubit({required this.useCase}) : super(const BaseState());
  Future get(int id) async {
    emit(state.copyWith(status: RxStatus.Loading));
    return await handleError(() async {
      final response = await useCase.getSubjectTeachers(id);
      return response.fold((l) {
        emit(state.copyWith(status: RxStatus.Error, errorMessage: l.message));
        showSimpleDialog(text: l.message.toString());
      }, (r) {
        emit(state.copyWith(status: RxStatus.Success, data: r.data));
        return r;
      });
    });
  }
}

import 'package:kafil/core/feature/data/models/user_wrapper.dart';
import 'package:kafil/export.dart';
import 'package:kafil/features/profile/domain/usecases/usecases.dart';

class ProfileCubit extends Cubit<BaseState<User>> {
  final ProfileUseCase useCase;

  ProfileCubit({required this.useCase}) : super(const BaseState());

  Future get() async {
    emit(state.copyWith(status: RxStatus.Loading));
    return await handleError(() async {
      final response = await useCase.getUser();
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

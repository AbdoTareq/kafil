import 'package:kafil/core/feature/data/models/dependencies_wrapper.dart';
import 'package:kafil/export.dart';
import 'package:kafil/features/dependencies/domain/usecases/usecases.dart';

class DependenciesCubit extends Cubit<BaseState<DependenciesWrapper>> {
  final DependenciesUseCase useCase;

  DependenciesCubit({required this.useCase}) : super(const BaseState());

  Future get() async {
    emit(state.copyWith(status: RxStatus.Loading));
    return await handleError(() async {
      final response = await useCase.get();
      return response.fold((l) {
        emit(state.copyWith(status: RxStatus.Error, errorMessage: l.message));
        showSimpleDialog(text: l.message.toString());
      }, (r) {
        emit(state.copyWith(status: RxStatus.Success, data: r));
        return r;
      });
    });
  }
}

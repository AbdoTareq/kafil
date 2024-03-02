import 'package:kafil/core/feature/data/models/services_wrapper.dart';
import 'package:kafil/export.dart';
import 'package:kafil/features/services/domain/usecases/usecases.dart';

class ServicesCubit extends Cubit<BaseState<ServicesWrapper>> {
  final ServicesUseCase useCase;

  ServicesCubit({required this.useCase}) : super(const BaseState());

  Future get(bool isPopular) async {
    emit(state.copyWith(status: RxStatus.Loading));
    return await handleError(() async {
      final response = await (isPopular
          ? useCase.getPopularServices()
          : useCase.getServices());
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

import 'package:kafil/core/feature/data/models/countries_wrapper.dart';
import 'package:kafil/export.dart';
import 'package:kafil/features/countries/domain/usecases/usecases.dart';

class CountriesCubit extends Cubit<BaseState<CountriesWrapper>> {
  final CountriesUseCase useCase;

  CountriesCubit({required this.useCase}) : super(const BaseState());

  Future get(int page) async {
    emit(state.copyWith(status: RxStatus.Loading));
    return await handleError(() async {
      final response = await useCase.getCountries(page);
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

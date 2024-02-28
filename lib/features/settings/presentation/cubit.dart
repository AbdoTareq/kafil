import 'package:kafil/core/feature/data/models/settings_model.dart';
import 'package:kafil/features/settings/domain/usecases/usecases.dart';

import '../../../../../export.dart';

part 'state.dart';

class SettingsCubit extends Cubit<BaseState<SettingsModel>> {
  SettingsCubit({required this.useCase})
      : super(const BaseState<SettingsModel>());
  final SettingsUseCase useCase;
  final GlobalKey<FormState> formKey = GlobalKey();

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

  Future contact(Map<String, String> user) async {
    if (formKey.currentState!.validate()) {
      return await handleError(() async {
        final response = await useCase.contact(user);
        return response.fold((l) {
          showSimpleDialog(text: l.message.toString());
        }, (r) {
          logger.i(r);
          return r;
        });
      });
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:kafil/core/feature/data/models/level_wrapper.dart';
import 'package:kafil/core/feature/data/models/teacher_detail_wrapper.dart';
import 'package:kafil/export.dart';
import 'package:kafil/features/home/domain/usecases/usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<LevelEvent, BaseState<List<LevelModel>>> {
  HomeBloc({required this.useCase}) : super(const BaseState()) {
    on<GetLevelsEvent>((event, emit) => get(event, emit));
  }
  final HomeUseCase useCase;
  Future get(GetLevelsEvent event, Emitter<BaseState> emit) async {
    emit(state.copyWith(status: RxStatus.Loading));
    return await handleError(() async {
      final response = await useCase.getLevels();
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

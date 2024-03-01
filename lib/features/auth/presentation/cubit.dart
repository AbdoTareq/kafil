import 'package:kafil/core/feature/data/models/user_wrapper.dart';
import 'package:kafil/features/auth/domain/usecases/usecases.dart';

import '../../../../../export.dart';

part 'state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.useCase,
    required this.box,
  }) : super(AuthState());
  final AuthUseCase useCase;
  final GetStorage box;

  Future<UserWrapper?> login(Map<String, String> user) async {
    return await handleError(() async {
      final response = await useCase.login(user);
      return response.fold((l) {
        showSimpleDialog(text: l.message.toString());
        return null;
      }, (r) {
        box.write(kUser, r.toJson());
        return r;
      });
    });
  }

  Future signup(Map<String, String> user) async {
    return await handleError(() async {
      final response = await useCase.signup(user);
      return response.fold((l) {
        showSimpleDialog(text: l.message.toString());
      }, (r) {
        logger.i(r.toJson());
        return r;
      });
    });
  }

  logout() async {
    return await handleError(() async {
      box.erase();
    });
  }
}

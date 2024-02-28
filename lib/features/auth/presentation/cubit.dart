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

  Future login(Map<String, String> user) async {
    return await handleError(() async {
      final response = await useCase.login(user);
      return response.fold((l) {
        showSimpleDialog(text: l.message.toString());
      }, (r) {
        box.write(kToken, r.toJson());
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
      final response = await useCase.logout(box.read(kType) ?? '');
      return response.fold((l) {
        showSimpleDialog(text: l.message.toString());
      }, (r) {
        logger.i(r.toJson());
        return r;
      });
    });
  }
}

import 'package:image_picker/image_picker.dart';
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

  final GlobalKey<FormState> basicFormKey = GlobalKey();
  final GlobalKey<FormState> completeFormKey = GlobalKey();
  Map<String, dynamic>? data;
  final ImagePicker _picker = ImagePicker();

  Future<UserWrapper?> login(Map<String, String> user) async {
    return await handleError(() async {
      final response = await useCase.login(user);
      return response.fold((l) {
        showSimpleDialog(text: l.message.toString());
        return null;
      }, (r) {
        box.write(kUser, r.toJson());
        if (r.accessToken != null) {
          box.write(kToken, r.accessToken);
        }
        return r;
      });
    });
  }

  Future signup(Map<String, dynamic> user) async {
    var temp = {...user, ...data!};
    return await handleError(() async {
      final response = await useCase.signup(temp);
      return response.fold((l) {
        showSimpleDialog(text: l.message.toString());
      }, (r) {
        logger.i(r.toJson());
        return r;
      });
    });
  }

  Future<XFile?> selectImage() async =>
      await _picker.pickImage(source: ImageSource.gallery);

  logout() async {
    return await handleError(() async {
      box.erase();
    });
  }
}

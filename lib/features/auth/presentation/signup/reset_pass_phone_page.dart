import 'package:kafil/assets.dart';
import 'package:kafil/core/view/widgets/rounded_corner_loading_button.dart';
import 'package:kafil/features/auth/presentation/reset_pass_cubit.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../export.dart';

@RoutePage()
class ResetPassPhonePage extends HookWidget {
  ResetPassPhonePage({
    super.key,
    this.phoneArg,
  });
  final String? phoneArg;
  final controller = sl<ResetPassCubit>();

  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final phoneTextController = useTextEditingController(text: phoneArg);
    final passTextController = useTextEditingController();
    final codeTextController = useTextEditingController();
    final isCodeOrPassword = useState(true);
    return Scaffold(
        body: Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesLogo),
          'Send Activation Code'.tr().text.bold.xl.make(),
          20.h.heightBox,
          TextInput(
            autofillHints: const [AutofillHints.telephoneNumber],
            controller: phoneTextController,
            textColor: kBlack,
            inputType: TextInputType.phone,
            hint: phone,
            prefixIcon: const Icon(Icons.phone),
            validate: (value) => value!.length == 11 ? null : phoneWar.tr(),
          ),
          if (!isCodeOrPassword.value) ...[
            TextInput(
              controller: codeTextController,
              textColor: kBlack,
              inputType: TextInputType.phone,
              hint: code,
              prefixIcon: const Icon(Icons.code),
              validate: (value) => value!.isNotEmpty ? null : war.tr(),
            ),
            PasswordInput(
              controller: passTextController,
              hint: pass,
            )
          ],
          20.heightBox,
          RoundedCornerLoadingButton(
            color: kBlack,
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                String? token;
                if (isCodeOrPassword.value) {
                  final res =
                      await controller.sendCode(phoneTextController.text);
                  if (res != null) {
                    token = res['token'];
                    isCodeOrPassword.value = false;
                  }
                } else {
                  final res = await controller.resetPass({
                    "phone": phoneTextController.text,
                    "reset_code": passTextController.text,
                    "token": token,
                    "password": passTextController.text,
                    "password_confirmation": passTextController.text,
                  });
                  if (res != null) {}
                }
              }
            },
            child: (isCodeOrPassword.value ? 'send code' : 'resetPassword')
                .tr()
                .text
                .bold
                .xl
                .make()
                .p8(),
          ).wFull(context),
          20.heightBox,
        ],
      ).pSymmetric(h: 16),
    ));
  }
}

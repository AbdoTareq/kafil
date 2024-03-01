import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kafil/assets.dart';
import 'package:kafil/core/app_router.dart';
import 'package:kafil/core/view/widgets/rounded_corner_loading_button.dart';
import 'package:kafil/features/auth/presentation/cubit.dart';

import '../../../../../export.dart';

@RoutePage()
class LoginPage extends HookWidget {
  LoginPage({super.key});
  final controller = sl<AuthCubit>();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final emailTextController = useTextEditingController();
    final passTextController = useTextEditingController();

    loginClick() async {
      if (formKey.currentState!.validate()) {
        final res = await controller.login({
          "email": emailTextController.text,
          "password": passTextController.text,
        });
        if (res?.data?.active == true) {
          context.router.replaceAll([HomeRoute()]);
        } else if (res?.data?.active == false) {
          showSimpleDialog(
              text: 'You have been blocked Ask the admin to unblock you');
        }
      }
    }

    return Scaffold(
        backgroundColor: Vx.gray900,
        appBar: CustomAppBar(title: accountLogin.tr()),
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesLogo),
              TextInput(
                autofillHints: const [AutofillHints.email],
                controller: emailTextController,
                textColor: kBlack,
                inputType: TextInputType.emailAddress,
                hint: mail,
                validate: (value) => value!.length == 11 ? null : mailWar.tr(),
              ),
              PasswordInput(
                controller: passTextController,
                hint: pass,
              ),
              forgetPass
                  .tr()
                  .text
                  .end
                  .bold
                  .make()
                  .p2()
                  .wFull(context)
                  .onTap(() {}),
              20.heightBox,
              RoundedCornerLoadingButton(
                color: kBlack,
                onPressed: loginClick,
                child: accountLogin.tr().text.bold.xl.make().p8(),
              ).wFull(context),
              20.heightBox,
              dontHaveAccount.tr().text.bold.makeCentered().p2().onTap(() {
                context.pushRoute(SignUpRoute());
              }),
            ],
          ).pSymmetric(h: 16),
        ));
  }
}

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafil/assets.dart';
import 'package:kafil/core/app_router.dart';
import 'package:kafil/core/view/widgets/rounded_corner_loading_button.dart';
import 'package:kafil/features/auth/presentation/cubit.dart';
import 'package:super_rich_text/super_rich_text.dart';

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
    final isRemember = useState(true);

    loginClick() async {
      if (formKey.currentState!.validate()) {
        final res = await controller.login({
          "email": emailTextController.text,
          "password": passTextController.text,
        });
        if (res != null) {
          logger.i(res.toJson());
          context.router.replaceAll([const HomeRoute()]);
        }
      }
    }

    return Scaffold(
        backgroundColor: kBGGreyColor,
        appBar: CustomAppBar(title: accountLogin.tr()),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              32.h.heightBox,
              SvgPicture.asset(Assets.imagesLogin),
              20.h.heightBox,
              TextInput(
                autofillHints: const [AutofillHints.email],
                controller: emailTextController,
                textColor: kBlack,
                inputType: TextInputType.emailAddress,
                hint: mail,
                validate: (value) => value!.contains('@') ? null : mailWar.tr(),
              ).px20(),
              PasswordInput(
                controller: passTextController,
                hint: pass,
              ).px20(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                    activeColor: kPrimaryColor,
                    checkColor: kBGGreyColor,
                    side: MaterialStateBorderSide.resolveWith((states) =>
                        const BorderSide(width: 2, color: Colors.black12)),
                    title: Text(
                      remember.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: isRemember.value,
                    onChanged: (value) => isRemember.value = value!,
                  ).expand(),
                  Text(
                    forgetPass.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  12.w.widthBox,
                ],
              ).px12(),
              34.h.heightBox,
              RoundedCornerLoadingButton(
                onPressed: loginClick,
                child: Text(
                  login.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: kBGGreyColor),
                ),
              ).h(56.h).wFull(context).px20(),
              24.heightBox,
              SuperRichText(
                text: '${dontHaveAccount.tr()}  ll${signup.tr()}ll',
                style: Theme.of(context).textTheme.titleMedium!,
                othersMarkers: [
                  MarkerText(
                    marker: 'll',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: kPrimaryColor),
                  ),
                ],
              ).centered().p2().onTap(() {
                context.pushRoute(SignUpRoute());
              }),
            ],
          ),
        ));
  }
}

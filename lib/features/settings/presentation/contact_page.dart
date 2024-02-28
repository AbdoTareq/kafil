import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kafil/assets.dart';
import 'package:kafil/core/view/widgets/rounded_corner_loading_button.dart';
import 'package:kafil/features/settings/presentation/cubit.dart';

import '../../../../export.dart';

@RoutePage()
class ContactPage extends HookWidget {
  ContactPage({super.key});
  final controller = sl<SettingsCubit>();

  @override
  Widget build(BuildContext context) {
    final nameTextController = useTextEditingController();
    final phoneTextController = useTextEditingController();
    final emailTextController = useTextEditingController();
    final messageTextController = useTextEditingController();
    return Scaffold(
        appBar: const CustomAppBar(title: contact),
        body: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesLogo),
              20.h.heightBox,
              TextInput(
                autofillHints: const [AutofillHints.name],
                controller: nameTextController,
                textColor: kBlack,
                inputType: TextInputType.name,
                hint: name,
                prefixIcon: const Icon(Icons.person),
                validate: (value) => value!.length > 3 ? null : nameWar.tr(),
              ),
              TextInput(
                autofillHints: const [AutofillHints.telephoneNumber],
                controller: phoneTextController,
                textColor: kBlack,
                inputType: TextInputType.phone,
                hint: phone,
                prefixIcon: const Icon(Icons.phone),
                validate: (value) => value!.length == 11 ? null : phoneWar.tr(),
              ),
              TextInput(
                autofillHints: const [AutofillHints.email],
                controller: emailTextController,
                textColor: kBlack,
                inputType: TextInputType.emailAddress,
                hint: mail,
                prefixIcon: const Icon(Icons.email),
                validate: (value) => isEmail(value!) ? null : mailWar.tr(),
              ),
              TextInput(
                autofillHints: const [AutofillHints.name],
                controller: messageTextController,
                textColor: kBlack,
                inputType: TextInputType.text,
                hint: mail,
                prefixIcon: const Icon(Icons.description),
                validate: (value) => value!.isNotEmpty ? null : war.tr(),
              ),
              RoundedCornerLoadingButton(
                color: kBlack,
                onPressed: () async {
                  final res = await controller.contact({
                    "name": nameTextController.text,
                    "email": emailTextController.text,
                    "phone": phoneTextController.text,
                    "message": messageTextController.text,
                  });
                  if (res != null) {
                    showSimpleDialog(text: res.toString());
                  }
                },
                child: signup.tr().capitalized.text.bold.xl.make().p8(),
              ).wFull(context),
              20.heightBox,
              ifYouHaveAnAccount
                  .tr()
                  .capitalized
                  .text
                  .bold
                  .makeCentered()
                  .p2()
                  .onTap(() {
                context.popRoute();
              }),
            ],
          ).pSymmetric(h: 16),
        ));
  }
}

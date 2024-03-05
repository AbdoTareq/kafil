import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kafil/core/feature/data/models/user_wrapper.dart';
import 'package:kafil/core/view/widgets/rounded_corner_loading_button.dart';
import 'package:kafil/export.dart';
import 'package:kafil/features/auth/presentation/cubit.dart';

class BasicDataStep extends HookWidget {
  BasicDataStep({super.key, required this.continued});
  final Function continued;
  final controller = sl<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    final fNameTextController = useTextEditingController();
    final lNameTextController = useTextEditingController();
    final emailTextController = useTextEditingController();
    final passTextController = useTextEditingController();
    final confirmTextController = useTextEditingController();
    final ValueNotifier<Type?> chosenUserType = useState(null);
    return Form(
      key: controller.basicFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            16.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextInput(
                  controller: fNameTextController,
                  hint: firstName,
                  validate: (value) => value!.length > 3 ? null : nameWar.tr(),
                ).expand(),
                9.w.widthBox,
                TextInput(
                  controller: lNameTextController,
                  hint: lastName,
                  validate: (value) => value!.length > 3 ? null : nameWar.tr(),
                ).expand(),
              ],
            ),
            12.h.heightBox,
            TextInput(
              autofillHints: const [AutofillHints.email],
              controller: emailTextController,
              inputType: TextInputType.emailAddress,
              hint: mail,
              validate: (value) => value!.contains('@') ? null : mailWar.tr(),
            ),
            12.h.heightBox,
            PasswordInput(
              controller: passTextController,
              hint: pass,
            ),
            12.h.heightBox,
            PasswordInput(
              controller: confirmTextController,
              hint: confirmPass,
            ),
            12.h.heightBox,
            userType.capitalized.tr().text.gray500.make().wFull(context),
            12.h.heightBox,
            DropdownButtonFormField<Type>(
              decoration: InputDecoration(
                fillColor: kGreyColor,
                filled: true,
                border: kBorder,
                enabledBorder: kBorder,
                focusedErrorBorder: kBorder,
                errorBorder: kBorder,
                focusedBorder: kBorder,
              ),
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              onChanged: (newValue) => chosenUserType.value = newValue!,
              value: chosenUserType.value,
              validator: (value) => value != null ? null : war.tr(),
              items: userTypes
                  .map((valueItem) => DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem.name ?? ''),
                      ))
                  .toList(),
            ),
            42.h.heightBox,
            RoundedCornerLoadingButton(
              onPressed: () {
                if (controller.basicFormKey.currentState!.validate()) {
                  controller.data = {
                    'first_name': fNameTextController.text,
                    'last_name': lNameTextController.text,
                    'email': emailTextController.text,
                    'password': passTextController.text,
                    'password_confirmation': confirmTextController.text,
                    'type': chosenUserType.value?.code,
                  };
                  continued();
                }
              },
              child: Text(
                next.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: kBGGreyColor),
              ),
            ).w(160.w).h(56.h),
            34.h.heightBox,
          ],
        ),
      ),
    );
  }
}

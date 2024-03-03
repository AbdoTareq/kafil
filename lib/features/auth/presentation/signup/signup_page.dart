import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:kafil/core/feature/data/models/user_wrapper.dart';
import 'package:kafil/core/view/widgets/rounded_corner_loading_button.dart';
import 'package:kafil/features/auth/presentation/cubit.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../export.dart';

@RoutePage()
class SignUpPage extends HookWidget {
  SignUpPage({super.key});
  final controller = sl<AuthCubit>();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final fNameTextController = useTextEditingController();
    final lNameTextController = useTextEditingController();
    final emailTextController = useTextEditingController();
    final passTextController = useTextEditingController();
    final confirmTextController = useTextEditingController();

    nextClick() async {
      if (formKey.currentState!.validate()) {
        // final res = await controller.login({
        //   "email": emailTextController.text,
        //   "password": passTextController.text,
        // });
        // if (res != null) {
        //   logger.i(res.toJson());
        //   context.router.replaceAll([HomeRoute()]);
        // }
      }
    }

    return Scaffold(
        backgroundColor: kBGGreyColor,
        appBar: CustomAppBar(title: signup.tr()),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                32.h.heightBox,
                AnotherStepper(
                  stepperList: [
                    StepperData(
                        title: StepperText(
                          "Order Placed",
                          textStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        iconWidget: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child:
                              const Icon(Icons.looks_one, color: Colors.white),
                        )),
                    StepperData(
                      title: StepperText("Delivered",
                          textStyle: const TextStyle(
                            color: Colors.grey,
                          )),
                    ),
                  ],
                  stepperDirection: Axis.horizontal,
                  iconWidth:
                      40, // Height that will be applied to all the stepper icons
                  iconHeight:
                      40, // Width that will be applied to all the stepper icons
                ).h(50),
                32.h.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextInput(
                      controller: fNameTextController,
                      hint: firstName,
                      validate: (value) =>
                          value!.length > 3 ? null : nameWar.tr(),
                    ).expand(),
                    9.w.widthBox,
                    TextInput(
                      controller: lNameTextController,
                      hint: lastName,
                      validate: (value) =>
                          value!.length > 3 ? null : nameWar.tr(),
                    ).expand(),
                  ],
                ),
                12.h.heightBox,
                TextInput(
                  autofillHints: const [AutofillHints.email],
                  controller: emailTextController,
                  inputType: TextInputType.emailAddress,
                  hint: mail,
                  validate: (value) =>
                      value!.contains('@') ? null : mailWar.tr(),
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
                  onChanged: (newValue) {
                    // setState(() {
                    //   professionChoosed = newValue;
                    // });
                  },
                  items: userTypes
                      .map((valueItem) => DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem.name ?? ''),
                          ))
                      .toList(),
                ),
                42.h.heightBox,
                RoundedCornerLoadingButton(
                  onPressed: nextClick,
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
            ).px20(),
          ),
        ));
  }
}

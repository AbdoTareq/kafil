import 'dart:io';

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kafil/core/feature/data/models/gender.dart';
import 'package:kafil/core/view/widgets/rounded_corner_loading_button.dart';
import 'package:kafil/features/auth/presentation/cubit.dart';

import '../../../../../export.dart';

@RoutePage()
class CompleteDataPage extends HookWidget {
  CompleteDataPage({super.key});
  final controller = sl<AuthCubit>();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final imageState = useState(XFile(''));
    final aboutTextController = useTextEditingController();
    final salaryTextController = useTextEditingController();
    final birthDateTextController = useTextEditingController();
    final genderState = useState(genders.first);
    final isFace = useState(false);
    final isTwitter = useState(false);
    final isLinked = useState(false);

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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 41.5,
                          backgroundImage:
                              FileImage(File(imageState.value.path)),
                        ).py(32.r),
                        Positioned(
                          bottom: 30.r,
                          right: 0,
                          child: VxCircle(
                            radius: 25,
                            backgroundColor: kPrimaryColor,
                            child: const Icon(Icons.add, color: kBGGreyColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                TextInput(
                  controller: aboutTextController,
                  maxLines: 5,
                  minLines: 3,
                  inputType: TextInputType.name,
                  hint: about,
                ).px20(),
                16.h.heightBox,
                Text(
                  salary,
                  style: Theme.of(context).textTheme.titleSmall,
                ).px20(),
                8.h.heightBox,
                Container(
                  color: kGreyColor,
                  height: 56.r,
                  width: double.infinity,
                  child: VxStepper(),
                ).cornerRadius(8).px20(),
                16.h.heightBox,
                TextInput(
                  controller: birthDateTextController,
                  inputType: TextInputType.number,
                  hint: birthDate,
                  suffixIcon: SvgPicture.asset(Assets.imagesCalender),
                ).px20(),
                16.h.heightBox,
                Text(
                  gender,
                  style: Theme.of(context).textTheme.titleSmall,
                ).px20(),
                4.h.heightBox,
                Row(
                  children: genders
                      .map(
                        (e) => RadioListTile<Gender>(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          title: Text(
                            e.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          value: e,
                          groupValue: genderState.value,
                          onChanged: (val) => genderState.value = val!,
                        ).w32(context),
                      )
                      .toList(),
                ).px8(),
                8.h.heightBox,
                Text(
                  skills,
                  style: Theme.of(context).textTheme.titleSmall,
                ).px20(),
                16.h.heightBox,
                Container(
                  color: kGreyColor,
                  height: 94.r,
                  width: double.infinity,
                  child: Wrap(
                    children: []
                        .map((e) => Container(
                              color: kPrimaryColor.withOpacity(.1),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    e.name ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(color: kPrimaryColor),
                                  ),
                                  8.w.widthBox,
                                  Icon(
                                    Icons.close,
                                    color: kPrimaryColor.withOpacity(.6),
                                    size: 20,
                                  )
                                ],
                              ).p8(),
                            ).cornerRadius(8).p8())
                        .toList(),
                  ),
                ).cornerRadius(16).px20(),
                16.h.heightBox,
                Text(
                  favoriteSocialMedia,
                  style: Theme.of(context).textTheme.titleSmall,
                ).px20(),
                8.h.heightBox,
                CheckboxListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: kBGGreyColor,
                  title: Row(
                    children: [
                      VxCircle(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(Assets.imagesFace),
                      ),
                      16.w.widthBox,
                      Text(facebook.tr())
                    ],
                  ),
                  value: isFace.value,
                  onChanged: (bool? isChecked) => isFace.value = isChecked!,
                ).px8(),
                CheckboxListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: kBGGreyColor,
                  title: Row(
                    children: [
                      VxCircle(
                        radius: 20,
                        child: SvgPicture.asset(Assets.imagesTwitter,
                            fit: BoxFit.scaleDown),
                      ),
                      16.w.widthBox,
                      Text(twitter.tr())
                    ],
                  ),
                  value: isTwitter.value,
                  onChanged: (bool? isChecked) => isTwitter.value = isChecked!,
                ).px8(),
                CheckboxListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  checkColor: kBGGreyColor,
                  title: Row(
                    children: [
                      VxCircle(
                        radius: 20,
                        child: SvgPicture.asset(Assets.imagesLinkedin,
                            fit: BoxFit.scaleDown),
                      ),
                      16.w.widthBox,
                      Text(linkedin.tr())
                    ],
                  ),
                  value: isLinked.value,
                  onChanged: (bool? isChecked) => isLinked.value = isChecked!,
                ).px8(),
                10.h.heightBox,
                RoundedCornerLoadingButton(
                  onPressed: nextClick,
                  child: Text(
                    submit.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: kBGGreyColor),
                  ),
                ).wFull(context).h(56.h).px16(),
                34.h.heightBox,
              ],
            ),
          ),
        ));
  }
}

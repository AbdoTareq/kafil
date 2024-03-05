import 'dart:io';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kafil/core/app_router.dart';
import 'package:kafil/core/feature/data/models/dependencies_wrapper.dart';
import 'package:kafil/core/feature/data/models/gender.dart';
import 'package:kafil/core/feature/data/models/user_wrapper.dart';
import 'package:kafil/core/view/widgets/custom_cubit_builder.dart';
import 'package:kafil/core/view/widgets/multi_select_button.dart';
import 'package:kafil/core/view/widgets/rounded_corner_loading_button.dart';
import 'package:kafil/features/auth/presentation/cubit.dart';
import 'package:kafil/features/dependencies/dependencies_cubit.dart';

import '../../../../../export.dart';

class CompleteDataStep extends HookWidget {
  CompleteDataStep({super.key});
  final controller = sl<AuthCubit>();
  final dependenciesCubit = sl<DependenciesCubit>()..get();

  @override
  Widget build(BuildContext context) {
    final imageState = useState(XFile(''));
    final aboutTextController = useTextEditingController();
    final salaryTextController = useTextEditingController();
    final birthDateTextController = useTextEditingController();
    final genderState = useState(genders.first);
    final ValueNotifier<List<Types>> chosenTags = useState([]);
    final isFace = useState(false);
    final isTwitter = useState(false);
    final isLinked = useState(false);

    nextClick() async {
      if (controller.completeFormKey.currentState!.validate()) {
        final Map<String, dynamic> data = {
          'birth_date': birthDateTextController.text,
          'gender': genderState.value.id,
          'about': aboutTextController.text,
          'favorite_social_media': [
            [
              if (isFace.value) 'facebook',
              if (isTwitter.value) 'twitter',
              if (isLinked.value) 'x',
            ]
          ],
          'tags': [chosenTags.value.map((e) => e.value).toList()],
          'salary': salaryTextController.text,
          'avatar': imageState.value.path
        };
        logger.i(data);
        final res = await controller.signup(data);
        if (res != null) {
          logger.i(res.toJson());
          showSimpleDialog(text: res.toString());
          context.router.replaceAll([LoginRoute()]);
        }
      }
    }

    return Form(
      key: controller.completeFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    var value = await controller.selectImage();
                    if (value != null) {
                      imageState.value = value;
                    }
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 41.5,
                        backgroundImage: imageState.value.path.isEmpty
                            ? null
                            : FileImage(File(imageState.value.path)),
                      ),
                      Positioned(
                        bottom: 0.r,
                        right: 0,
                        child: VxCircle(
                          radius: 25,
                          backgroundColor: kPrimaryColor,
                          child: const Icon(Icons.add, color: kBGGreyColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            TextInput(
              controller: aboutTextController,
              maxLines: 5,
              minLines: 3,
              inputType: TextInputType.name,
              hint: about,
              validate: (value) => value!.isNotEmpty ? null : war.tr(),
            ),
            16.h.heightBox,
            Text(
              salary,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            8.h.heightBox,
            Container(
              color: kGreyColor,
              height: 56.r,
              width: double.infinity,
              child: VxStepper(
                min: 102,
                max: 1000,
                defaultValue: 105,
                step: 10,
                onChange: (val) => salaryTextController.text = val.toString(),
              ),
            ).cornerRadius(8),
            16.h.heightBox,
            TextInput(
              controller: birthDateTextController,
              inputType: TextInputType.number,
              hint: birthDate,
              disableInput: true,
              onTap: () async {
                birthDateTextController.text = (await showDatePicker(
                  context: context,
                  firstDate:
                      DateTime.now().subtract(const Duration(days: 20000)),
                  initialDate:
                      DateTime.now().subtract(const Duration(days: 20000)),
                  lastDate: DateTime.now(),
                ))
                    .toString()
                    .substring(0, 10);
              },
              validate: (value) => value!.isNotEmpty ? null : war.tr(),
              suffixIcon: SvgPicture.asset(Assets.imagesCalender),
            ),
            16.h.heightBox,
            Text(
              gender,
              style: Theme.of(context).textTheme.titleSmall,
            ),
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
            ),
            16.h.heightBox,
            CustomCubitBuilder<DependenciesWrapper>(
                cubit: dependenciesCubit,
                onSuccess: (context, state) {
                  final data = state.data?.data ?? Dependency();
                  return MultiSelectButton(
                    title: 'Choose your skills',
                    onConfirm: (list) {
                      chosenTags.value = list.map((e) => e as Types).toList();
                    },
                    allChoices: data.tags ?? [],
                    chosen: chosenTags.value,
                  );
                }),
            16.h.heightBox,
            Text(
              favoriteSocialMedia,
              style: Theme.of(context).textTheme.titleSmall,
            ),
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
            ),
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
            ),
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
            ),
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
            ).wFull(context).h(56.h),
            34.h.heightBox,
          ],
        ),
      ),
    );
  }
}

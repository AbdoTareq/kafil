import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kafil/core/feature/data/models/gender.dart';
import 'package:kafil/core/feature/data/models/user_type.dart';
import 'package:kafil/core/feature/data/models/user_wrapper.dart';
import 'package:kafil/core/view/widgets/custom_cubit_builder.dart';
import 'package:kafil/features/profile/presentation/profile_cubit.dart';

import '../../../../../export.dart';

@RoutePage()
class ProfilePage extends HookWidget {
  ProfilePage({super.key});
  final cubit = sl<ProfileCubit>()..get();

  @override
  Widget build(BuildContext context) {
    final fNameTextController = useTextEditingController();
    final lNameTextController = useTextEditingController();
    final emailTextController = useTextEditingController();
    final passTextController = useTextEditingController();
    final aboutTextController = useTextEditingController();
    final salaryTextController = useTextEditingController();
    final birthDateTextController = useTextEditingController();
    final userTypeState = useState(userTypes.first);
    final genderState = useState(genders.first);
    final isFace = useState(false);
    final isTwitter = useState(false);
    final isLinked = useState(false);
    return Scaffold(
      appBar: const CustomAppBar(title: whoAmI),
      body: Column(
        children: [
          Expanded(
            child: CustomCubitBuilder<User>(
                cubit: cubit,
                onSuccess: (context, state) {
                  final data = state.data!;
                  fNameTextController.text = data.firstName ?? '';
                  lNameTextController.text = data.lastName ?? '';
                  emailTextController.text = data.email ?? '';
                  aboutTextController.text = data.about ?? '';
                  salaryTextController.text = '${data.salary} ${sar.tr()}';
                  birthDateTextController.text = data.birthDate ?? '';
                  passTextController.text = '.......';
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 41.5,
                                  backgroundImage:
                                      NetworkImage(data.avatar ?? ''),
                                ).py(32.r),
                                Positioned(
                                  bottom: 30.r,
                                  right: 0,
                                  child: VxCircle(
                                    radius: 25,
                                    backgroundColor: kPrimaryColor,
                                    child: const Icon(Icons.add,
                                        color: kBGGreyColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                        ).px20(),
                        16.h.heightBox,
                        TextInput(
                          autofillHints: const [AutofillHints.email],
                          controller: emailTextController,
                          inputType: TextInputType.emailAddress,
                          hint: mail,
                          validate: (value) =>
                              value!.contains('@') ? null : mailWar.tr(),
                        ).px20(),
                        16.h.heightBox,
                        PasswordInput(
                          controller: passTextController,
                          hint: pass,
                        ).px20(),
                        16.h.heightBox,
                        Text(
                          userType,
                          style: Theme.of(context).textTheme.titleSmall,
                        ).px20(),
                        4.h.heightBox,
                        Row(
                          children: userTypes
                              .map(
                                (e) => RadioListTile<UserChoice>(
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.compact,
                                  title: Text(
                                    e.name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  value: e,
                                  groupValue: userTypeState.value,
                                  onChanged: (val) =>
                                      userTypeState.value = val!,
                                ).expand(),
                              )
                              .toList(),
                        ).px8(),
                        16.h.heightBox,
                        TextInput(
                          controller: aboutTextController,
                          maxLines: 5,
                          minLines: 3,
                          inputType: TextInputType.name,
                          hint: about,
                        ).px20(),
                        16.h.heightBox,
                        TextInput(
                          controller: salaryTextController,
                          inputType: TextInputType.number,
                          hint: salary,
                        ).px20(),
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
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  value: e,
                                  groupValue: genderState.value,
                                  onChanged: (val) => genderState.value = val!,
                                ).w32(context),
                              )
                              .toList(),
                        ).px8(),
                        16.h.heightBox,
                        Text(
                          favoriteSocialMedia,
                          style: Theme.of(context).textTheme.titleSmall,
                        ).px20(),
                        16.h.heightBox,
                        CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(facebook.tr()),
                          value: isFace.value,
                          onChanged: (bool? isChecked) =>
                              isFace.value = isChecked!,
                        ).px20(),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:kafil/assets.dart';
import 'package:kafil/core/feature/data/models/settings_model.dart';
import 'package:kafil/core/view/widgets/custom_cubit_builder.dart';
import 'package:kafil/features/settings/presentation/cubit.dart';

import '../../../../export.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final controller = sl<SettingsCubit>()..get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: contact),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Assets.imagesLogo),
              CustomCubitBuilder<SettingsModel>(
                  cubit: controller,
                  onSuccess: (context, state) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          (state.data!.appName ?? '').text.bold.xl.make(),
                          (state.data!.description ?? '').text.bold.xl.make(),
                          12.heightBox,
                          'Phone: ${(state.data!.phone ?? '')}'
                              .text
                              .start
                              .bold
                              .xl
                              .make()
                              .wFull(context),
                          'Address: ${(state.data!.address ?? '')}'
                              .text
                              .start
                              .bold
                              .xl
                              .make()
                              .wFull(context),
                          'Email: ${(state.data!.email ?? '')}'
                              .text
                              .start
                              .bold
                              .xl
                              .make()
                              .wFull(context),
                          'Version: ${(Platform.isAndroid ? state.data!.androidVersion : state.data?.iosVersion ?? '')}'
                              .text
                              .start
                              .bold
                              .xl
                              .make()
                              .wFull(context),
                          12.heightBox,
                        ],
                      ).wFull(context),
                    );
                  }),
              20.h.heightBox,
            ],
          ).pSymmetric(h: 16),
        ).px12(),
      ),
    );
  }
}

import 'package:kafil/assets.dart';
import 'package:kafil/core/view/widgets/custom_cubit_builder.dart';
import 'package:kafil/core/view/widgets/old_fade_image.dart';
import 'package:kafil/core/view/widgets/rounded_corner_loading_button.dart';
import 'package:kafil/features/teachers/presentation/bloc/teacher_meetings_cubit.dart';

import '../../../../../export.dart';

@RoutePage()
class TeacherMeetingsPage extends StatelessWidget {
  TeacherMeetingsPage({super.key});
  final cubit = sl<TeacherMeetingsCubit>()..get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Teacher Meetings Page"),
      body: Column(
        children: [
          RoundedCornerLoadingButton(
              onPressed: () => cubit.endMeeting(1),
              child:
                  'end meeting with id  1'.tr().text.white.bold.xl.make().p8()),
          RoundedCornerLoadingButton(
              onPressed: () =>
                  cubit.sendZoomNotification(1, "zoom_id", "zoom_password"),
              child:
                  'sendZoomNotification '.tr().text.white.bold.xl.make().p8()),
          Expanded(
            child: CustomCubitBuilder<Map>(
                cubit: cubit,
                onSuccess: (context, state) {
                  final data = state.data!;
                  return CustomListViewBuilder(
                    itemCount: data.length,
                    footer: 40.heightBox,
                    itemBuilder: (BuildContext context, int index) {
                      final item = data[index];
                      return Column(
                        children: [
                          20.heightBox,
                          20.heightBox,
                        ],
                      ).card.make();
                    },
                  ).px8().py8();
                }),
          ),
        ],
      ),
    );
  }
}

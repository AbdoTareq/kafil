import 'package:kafil/core/feature/data/models/subject_teachers_wrapper.dart';
import 'package:kafil/core/view/widgets/custom_cubit_builder.dart';
import 'package:kafil/features/teachers/presentation/bloc/subject_teachers_cubit.dart';

import '../../../../export.dart';

@RoutePage()
class SubjectTeachersPage extends StatelessWidget {
  SubjectTeachersPage({super.key, required this.subjectId});
  final cubit = sl<SubjectTeachersCubit>();
  final int subjectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Subject Teachers"),
      body: CustomCubitBuilder<List<SubjectTeacherModel>>(
          cubit: cubit..get(subjectId),
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
                    item.name.toString().text.bold.xl.make(),
                    VxRating(
                      onRatingUpdate: (value) {},
                      isSelectable: false,
                      maxRating: 5,
                      value: (item.rate ?? 0).toDouble(),
                    ),
                    20.heightBox,
                  ],
                ).card.make().onTap(() {});
              },
            ).px8().py8();
          }),
    );
  }
}

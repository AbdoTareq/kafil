import 'package:kafil/core/view/widgets/custom_cubit_builder.dart';
import 'package:kafil/features/profile/presentation/profile_cubit.dart';

import '../../../../../export.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final cubit = sl<ProfileCubit>()..get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: whoAmI),
      body: Column(
        children: [
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

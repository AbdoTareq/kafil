import 'package:kafil/core/app_router.dart';
import 'package:kafil/core/feature/data/models/level_wrapper.dart';
import 'package:kafil/core/view/widgets/custom_bloc_builder.dart';
import 'package:kafil/features/home/presentation/bloc/home_bloc.dart';

import '../../../../export.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final bloc = sl<HomeBloc>()..add(const GetLevelsEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Levels"),
      body: CustomBlocBuilder<LevelEvent, List<LevelModel>>(
          bloc: bloc,
          onSuccess: (context, state) {
            return CustomListViewBuilder(
                itemCount: state.data!.length,
                itemBuilder: (context, index) {
                  final item = state.data![index];
                  return Card(
                    child: Column(
                      children: [
                        item.name.toString().text.bold.xl.make().p8(),
                        Wrap(
                          children: item.years!
                              .map((e) => RoundedCornerButton(
                                      color: kBlack,
                                      onPressed: () {
                                        context.pushRoute(
                                            YearSubjectsRoute(year: e));
                                      },
                                      child:
                                          e.name.toString().text.bold.xl.make())
                                  .p4())
                              .toList(),
                        ),
                        10.heightBox
                      ],
                    ),
                  );
                });
          }).px12(),
    );
  }
}

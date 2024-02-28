import 'package:kafil/core/app_router.dart';
import 'package:kafil/core/feature/data/models/level_wrapper.dart';

import '../../../../export.dart';

@RoutePage()
class YearSubjectsPage extends StatelessWidget {
  const YearSubjectsPage({super.key, required this.year});
  final Year year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: year.name ?? ''),
        body: Column(
          children: year.subjects!
              .map(
                (e) => Card(
                  child: ListTile(
                    title: e.name.toString().text.bold.xl.make().p8(),
                    onTap: () {
                      if (e.id != null) {
                        context
                            .pushRoute(SubjectTeachersRoute(subjectId: e.id!));
                      }
                    },
                  ),
                ),
              )
              .toList(),
        ).p4());
  }
}

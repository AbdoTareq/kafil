import 'package:flutter_svg/svg.dart';
import 'package:kafil/assets.dart';
import 'package:kafil/core/feature/data/models/services_wrapper.dart';
import 'package:kafil/core/view/widgets/custom_cubit_builder.dart';
import 'package:kafil/features/services/presentation/service_item.dart';
import 'package:kafil/features/services/presentation/services_cubit.dart';

import '../../../../../export.dart';

@RoutePage()
class ServicesPage extends StatelessWidget {
  ServicesPage({super.key});
  final cubit = sl<ServicesCubit>()..get(false);
  final popularCubit = sl<ServicesCubit>(instanceName: kPopular)..get(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: services),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            32.h.heightBox,
            SizedBox(
              height: 191.r,
              child: CustomCubitBuilder<ServicesWrapper>(
                  cubit: cubit,
                  onSuccess: (context, state) {
                    final data = state.data?.data ?? [];
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = data[index];
                        return ServiceItem(item: item);
                      },
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.r),
              child: Text(
                popularServices.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(
              height: 191.r,
              child: CustomCubitBuilder<ServicesWrapper>(
                  cubit: popularCubit,
                  onSuccess: (context, state) {
                    final data = state.data?.data ?? [];
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = data[index];
                        return ServiceItem(item: item);
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

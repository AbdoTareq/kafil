import 'package:kafil/core/feature/data/models/countries_wrapper.dart';
import 'package:kafil/core/view/widgets/custom_cubit_builder.dart';
import 'package:kafil/features/countries/presentation/countries_cubit.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../../../../export.dart';

@RoutePage()
class CountriesPage extends StatelessWidget {
  CountriesPage({super.key});
  final cubit = sl<CountriesCubit>()..get(1);
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: countries),
      body: Column(
        children: [
          Expanded(
            child: CustomCubitBuilder<CountriesWrapper>(
              cubit: cubit,
              onSuccess: (context, state) {
                final data = state.data!.data!;
                return Column(
                  children: [
                    32.r.heightBox,
                    Card(
                            child: DataTable(
                                dataTextStyle:
                                    Theme.of(context).textTheme.displaySmall,
                                headingTextStyle:
                                    Theme.of(context).textTheme.labelSmall,
                                headingRowHeight: 48.r,
                                dividerThickness: 0,
                                columnSpacing: 40,
                                dataRowMaxHeight: 32.r,
                                dataRowMinHeight: 20,
                                columns: [
                                  DataColumn(
                                    label: Text(country.tr()).w32(context),
                                  ),
                                  DataColumn(
                                    label: Text(capital.tr()).w32(context),
                                  )
                                ],
                                rows: data
                                    .map((item) => DataRow(
                                          cells: [
                                            DataCell(
                                              Text(
                                                item.name ?? '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ).w32(context),
                                            ),
                                            DataCell(
                                              Text(
                                                item.capital ?? '',
                                                maxLines: 1,
                                              ).w32(context),
                                            ),
                                          ],
                                        ))
                                    .toList()))
                        .cornerRadius(8),
                    StatefulBuilder(builder: (context, setState) {
                      return NumberPaginator(
                        initialPage: _page - 1,
                        numberPages: state.data?.pagination?.total ?? 0,
                        onPageChange: (int index) {
                          _page = index + 1;
                          cubit.get(_page);
                          setState() {}
                        },
                      );
                    }),
                  ],
                ).px20();
              },
            ),
          ),
        ],
      ),
    );
  }
}

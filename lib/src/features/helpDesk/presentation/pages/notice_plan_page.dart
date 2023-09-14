import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/app_dialog.dart';
import '../../../../common/widgets/background.dart';
import '../../../../locator.dart';
import '../../data/datasources/notice_plan_temp_db.dart';
import '../../domain/entities/notice_info.dart';
import '../bloc/notice_plan/notice_plan_bloc.dart';
import '../widgets/widgets.dart';

class NoticePlanPage extends StatelessWidget {
  const NoticePlanPage({super.key});
  static const routeName = '/noticePlanPage';

  @override
  Widget build(BuildContext context) {
    DateTime? fromDate;
    DateTime? toDate;

    return  Builder(
        builder: (context) {
          return BackgroundDecoration(
            body: Column(
              children: [
                const MinimalAppBar(title: 'Notice Plan'),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: NoticeDateRangeSelector(
                    onDateRangeSelected: (startDate, endDate) {
                      fromDate = startDate;
                      toDate = endDate;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SearchWidget(onSearch: (searchText) {
                    final event = OnSearch(searchText: searchText, fromDate: fromDate, toDate: toDate);
                    context.read<NoticePlanBloc>().add(event);
                  }),
                ),
                Expanded(
                  child: BlocBuilder<NoticePlanBloc, NoticePlanState>(
                    bloc: locator.get<NoticePlanBloc>()..add(InitialLoad()),
                    builder: (context, state) {
                      if (state is NoticePlanInitial) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Text("Search Notice Plan"),
                        );
                      } else if (state is NoticePlanLoading) {
                        return defaultLoadingIndication;
                      } else if (state is NoticePlanError) {
                        return Center(child: Text(state.message));
                      } else if (state is NoticePlanLoaded) {
                        if (state.notices.isEmpty) {
                          return const Center(child: Text("No Notice Found"));
                        }
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemCount: state.notices.length,
                          itemBuilder: (context, index) {
                            return GeneralListTile(
                              title: state.notices[index].title ?? "NA",
                              description: state.notices[index].summary ?? "NA",
                              onView: () {},
                              onDownload: () {},
                            );
                          },
                        );
                      }
                      return Text("NA State $state");
                    },
                  ),
                )
              ],
            ),
          );
        },
      
    );
  }
}

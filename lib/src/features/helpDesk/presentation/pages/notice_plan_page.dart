import 'package:ek_sheba/src/features/helpDesk/presentation/widgets/notice_date_range_selector.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/background.dart';
import '../../data/datasources/notice_plan_temp_db.dart';
import '../widgets/minimal_appbar.dart';
import '../widgets/widgets.dart';

class NoticePlanPage extends StatelessWidget {
  const NoticePlanPage({super.key});
  static const routeName = '/noticePlanPage';

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      body: Column(
        children: [
          MinimalAppBar(
            title: 'Notice Plan',
            onBackButtonPressed: () {},
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NoticeDateRangeSelector(
              onDateRangeSelected: (startDate, endDate) {},
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SearchWidget(
              onSearch: (searchText) {},
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: noticePlanTempDB.length,
              itemBuilder: (context, index) {
                return GeneralListTile(
                  title: noticePlanTempDB[index].title,
                  description: noticePlanTempDB[index].description,
                  onView: () {},
                  onDownload: () {},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

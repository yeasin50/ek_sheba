import '../../../../common/app_style.dart';
import '../../../../common/utils/app_date_format.dart';
import 'package:flutter/material.dart';

typedef OnDateRangeSelected = void Function(DateTime? startDate, DateTime? endDate);

class NoticeDateRangeSelector extends StatefulWidget {
  const NoticeDateRangeSelector({
    super.key,
    required this.onDateRangeSelected,
  });

  final OnDateRangeSelected onDateRangeSelected;

  @override
  State<NoticeDateRangeSelector> createState() => _NoticeDateRangeSelectorState();
}

class _NoticeDateRangeSelectorState extends State<NoticeDateRangeSelector> {
  DateTime? _startDate;
  DateTime? _endDate;

  void _onStartDateSelected() async {
    final date = await _showDatePicker();
    if (date == null) return;
    setState(() {
      _startDate = date;
    });
    widget.onDateRangeSelected(_startDate, _endDate);
  }

  void _onEndDateSelected() async {
    final date = await _showDatePicker();
    if (date == null) return;
    setState(() {
      _endDate = date;
    });
    widget.onDateRangeSelected(_startDate, _endDate);
  }

  Widget _buildDateWidget(String text, VoidCallback? onTap) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      onTap: onTap,
      child: Material(
        color: AppStyle.textWhite,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Text(text),
              const Spacer(),
              const Icon(
                Icons.calendar_today_outlined,
                color: AppStyle.textBlack,
                size: 16,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppStyle.buttonGreenLight,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 30,
        ),
        child: Row(
          children: [
            Expanded(
              child: _buildDateWidget(
                AppDateFormatter.getFormattedDate(_startDate) ?? 'Start Date',
                _onStartDateSelected,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDateWidget(
                AppDateFormatter.getFormattedDate(_endDate) ?? 'To Date',
                _onEndDateSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> _showDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    return date;
  }
}

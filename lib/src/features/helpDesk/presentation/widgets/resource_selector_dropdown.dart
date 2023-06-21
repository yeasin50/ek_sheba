import 'package:ek_sheba/src/common/app_style.dart';
import 'package:flutter/material.dart';

class ResourceSelectorDropDown extends StatefulWidget {
  const ResourceSelectorDropDown({super.key});

  @override
  State<ResourceSelectorDropDown> createState() => _ResourceSelectorDropDownState();
}

class _ResourceSelectorDropDownState extends State<ResourceSelectorDropDown> {
  final List<String> _categories = [
    'All',
    'Project Processing, Appraisal & Management (PPS)',
    'National Plan Management System (NPM)',
    'Research Management System (RMS)',
    'GIS Based Resource Management System (GRM)',
  ];

  final List<String> _years = [
    'All',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
  ];

  final List<String> _months = [
    'All',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
  ];

  String? _selectedCategory;
  String? _selectedYear;
  String? _selectedMonth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        color: AppStyle.buttonGreenLight,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              ResourceDropdownButton(
                items: _categories,
                value: _selectedCategory,
                hint: 'Select Category',
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ResourceDropdownButton(
                      items: _years,
                      value: _selectedYear,
                      hint: 'Select Year',
                      onChanged: (value) {
                        setState(() {
                          _selectedYear = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ResourceDropdownButton(
                      items: _months,
                      value: _selectedMonth,
                      hint: 'Select Month',
                      onChanged: (value) {
                        setState(() {
                          _selectedMonth = value;
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResourceDropdownButton extends StatelessWidget {
  const ResourceDropdownButton({
    Key? key,
    required this.items,
    this.value,
    this.hint,
    this.onChanged,
  }) : super(key: key);

  final List<String> items;
  final String? value;
  final String? hint;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        child: DropdownButton(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          underline: const SizedBox.shrink(),
          isExpanded: true,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppStyle.textBlack,
          ),
          items: items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: const TextStyle(color: AppStyle.textBlack),
                  ),
                ),
              )
              .toList(),
          hint: const Text('Select Category'),
          onChanged: onChanged,
          value: value,
        ),
      ),
    );
  }
}

import 'package:ek_sheba/src/common/app_style.dart';
import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:ek_sheba/src/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/resource/resource_bloc.dart';

class ResourceSelectorDropDown extends StatefulWidget {
  const ResourceSelectorDropDown({super.key});

  @override
  State<ResourceSelectorDropDown> createState() => _ResourceSelectorDropDownState();
}

class _ResourceSelectorDropDownState extends State<ResourceSelectorDropDown> {
  List<String> _categories = [];

  List<String> _years = [];

  List<String> _months = [];

  String? _selectedCategory;
  String? _selectedYear;
  String? _selectedMonth;

  late final ResourceBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = locator.get<ResourceBloc>()..add(ResourceFilterRequested());
  }

  _onItemChanged() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        color: AppStyle.buttonGreenLight,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: BlocBuilder<ResourceBloc, ResourceState>(
            bloc: bloc,
            builder: (context, state) {
              _categories = ["All", ...state.resourceInfo?.categoryList ?? []];
              _months = ["All", ...state.resourceInfo?.monthList ?? []];
              _years = ["All", ...state.resourceInfo?.yearList ?? []];

              logger.i(state.toString());

              return Column(
                children: [
                  ResourceDropdownButton(
                    items: _categories,
                    value: _selectedCategory,
                    hint: 'Select Category',
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                      if (_selectedCategory == null) return;

                      final event = ResourceYearListRequested(category: _selectedCategory!);
                      context.read<ResourceBloc>().add(event);
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
                            if (_selectedYear == null) return;
                            final event = ResourceMonthListRequested(year: _selectedYear!);
                            context.read<ResourceBloc>().add(event);
                            _onItemChanged();
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
                            _onItemChanged();
                          },
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
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

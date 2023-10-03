import '../../../../common/utils/logger.dart';
import '../utils/active_sector.dart';
import '../utils/active_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_button.dart';

typedef OnSearch = void Function(
  String? value,
  int? sectorId,
  String? status,
);

class CriteriaBasedSearch extends StatefulWidget {
  const CriteriaBasedSearch({
    required this.onSearch,
    Key? key,
  }) : super(key: key);

  final OnSearch onSearch;

  @override
  State<CriteriaBasedSearch> createState() => _CriteriaBasedSearchState();
}

class _CriteriaBasedSearchState extends State<CriteriaBasedSearch> {
  Map<int, String> sectors = {};
  final List<String> projectStatus = [];

  final TextEditingController _searchController = TextEditingController();
  int? _sectorId;
  String? _status;

  @override
  void initState() {
    super.initState();
    loadActiveSector().then((value) {
      setState(() {
        sectors.addAll(value);
      });
    }).catchError((e) {
      logger.e(e);
    });

    loadActiveStatus().then((value) {
      setState(() {
        projectStatus.addAll(value);
      });
    }).catchError((e) {
      logger.e(e);
    });
  }

  void _onSearch() {
    widget.onSearch(_searchController.text, _sectorId, _status?.replaceAll(' ', '_'));
  }

  void _clearEntry() {
    _searchController.clear();

    _sectorId = null;
    _status = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var sectorDropdownButtonFormField = DropdownButtonFormField<int?>(
      decoration: inputDecoration('Sector'),
      isExpanded: true,
      value: _sectorId,
      items: sectors.entries
          .map(
            (e) => DropdownMenuItem(
              value: e.key,
              child: Text(e.value),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          _sectorId = value;
        });
      },
    );
    var statusDropdownButtonFormField = DropdownButtonFormField<String?>(
      decoration: inputDecoration('Status'),
      isExpanded: true,
      value: _status,
      items: projectStatus
          .map(
            (e) => DropdownMenuItem(
              child: Text(e),
              value: e,
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          _status = value;
        });
      },
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 48,
          child: CupertinoSearchTextField(
            controller: _searchController,
            placeholder: 'Enter Project Name',
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: sectorDropdownButtonFormField),
            const SizedBox(width: 8),
            Expanded(child: statusDropdownButtonFormField),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 150,
                child: AppButton(
                  text: 'Search',
                  isFilled: true,
                  onPressed: _onSearch,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: AppButton(
                text: 'Clear',
                isFilled: false,
                onPressed: _clearEntry,
              ),
            ),
          ],
        ),
      ],
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      hintText: hint,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}

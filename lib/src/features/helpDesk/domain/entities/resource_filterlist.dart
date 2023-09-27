import 'dart:convert';

import 'package:equatable/equatable.dart';

class ResourceFilterInfo extends Equatable {
  const ResourceFilterInfo({
    required this.categoryList,
    required this.yearList,
    required this.monthList,
  });

  final List<String> categoryList;
  final List<String> yearList;
  final List<String> monthList;

  @override
  List<Object?> get props => [categoryList, yearList, monthList];

  ResourceFilterInfo copyWith({
    List<String>? categoryList,
    List<String>? yearList,
    List<String>? monthList,
  }) {
    return ResourceFilterInfo(
      categoryList: categoryList ?? this.categoryList,
      yearList: yearList ?? this.yearList,
      monthList: monthList ?? this.monthList,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'categoryList': categoryList});
    result.addAll({'yearList': yearList});
    result.addAll({'monthList': monthList});

    return result;
  }

  factory ResourceFilterInfo.fromMap(Map<String, dynamic> map) {
    return ResourceFilterInfo(
      categoryList: List<String>.from(map['categoryList']),
      yearList: List<String>.from(map['yearList']),
      monthList: List<String>.from(map['monthList']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceFilterInfo.fromJson(String source) =>
      ResourceFilterInfo.fromMap(json.decode(source));

  @override
  String toString() =>
      'ResourceFilterInfo(categoryList: $categoryList, yearList: $yearList, monthList: $monthList)';
}

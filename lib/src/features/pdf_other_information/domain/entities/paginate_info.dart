import 'dart:convert';

import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:equatable/equatable.dart';

import 'pdf_other_info_model.dart';

/// Hold general information about pagination including data list[]
/// used on [ProjectOtherInformation] and [ProjectRelatedMeetings]
/// * it have more than theses properties
class PaginatedProjectAttachments extends Equatable {
  const PaginatedProjectAttachments({
    this.isLast = false,
    this.numberOfElements = 0,
    this.totalElements = 0,
    this.empty = false,
    this.content = const [],
  });

  /// is this the last page
  /// show load more button if false
  final bool isLast;
  final int numberOfElements;
  final int totalElements;
  final bool empty;

  final List<PdfOtherInfoModel> content;

  @override
  List<Object?> get props => [
        isLast,
        numberOfElements,
        totalElements,
        empty,
        content,
      ];

  factory PaginatedProjectAttachments.fromMap(Map<String, dynamic> map) {
    logger.d('PaginatedProjectAttachments.fromMap t:${map['totalElements']} isLast: ${map['last']}');
    return PaginatedProjectAttachments(
      isLast: map['last'] ?? false,
      numberOfElements: map['numberOfElements']?.toInt() ?? 0,
      totalElements: map['totalElements']?.toInt() ?? 0,
      empty: map['empty'] ?? false,
      content: List<PdfOtherInfoModel>.from(map['content']?.map((x) => PdfOtherInfoModel.fromMap(x))),
    );
  }

  factory PaginatedProjectAttachments.fromJson(String source) =>
      PaginatedProjectAttachments.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaginatedProjectAttachments(isLast: $isLast, numberOfElements: $numberOfElements, totalElements: $totalElements, empty: $empty, content: $content)';
  }
}

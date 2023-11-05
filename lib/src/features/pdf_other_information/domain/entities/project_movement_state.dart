import 'dart:convert';

import 'package:equatable/equatable.dart';

/// used by `Related Meeting Attachments`
class ProjectMovementState extends Equatable {
  const ProjectMovementState({
    required this.id,
    required this.uuid,
    this.isDeleted,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.projectConceptMasterId,
    this.fsProposalMasterId,
    this.currentStage,
    this.movementTime,
    this.dppMasterId,
    this.tappMasterId,
    this.rdppMasterId,
    this.rtappMasterId,
    this.userId,
  });

  final int id;
  final String uuid;
  final bool? isDeleted;
  final String? createdBy;
  final String? createdOn;
  final String? updatedBy;
  final String? updatedOn;
  final String? projectConceptMasterId;
  final String? fsProposalMasterId;
  final String? currentStage;
  final String? movementTime;
  final String? dppMasterId;
  final String? tappMasterId;
  final String? rdppMasterId;
  final String? rtappMasterId;
  final String? userId;

  @override
  List<Object?> get props => [
        id,
        uuid,
        isDeleted,
        createdBy,
        createdOn,
        updatedBy,
        updatedOn,
        projectConceptMasterId,
        fsProposalMasterId,
        currentStage,
        movementTime,
        dppMasterId,
        tappMasterId,
        rdppMasterId,
        rtappMasterId,
        userId,
      ];

  ProjectMovementState copyWith({
    int? id,
    String? uuid,
    bool? isDeleted,
    String? createdBy,
    String? createdOn,
    String? updatedBy,
    String? updatedOn,
    String? projectConceptMasterId,
    String? fsProposalMasterId,
    String? currentStage,
    String? movementTime,
    String? dppMasterId,
    String? tappMasterId,
    String? rdppMasterId,
    String? rtappMasterId,
    String? userId,
  }) {
    return ProjectMovementState(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      isDeleted: isDeleted ?? this.isDeleted,
      createdBy: createdBy ?? this.createdBy,
      createdOn: createdOn ?? this.createdOn,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedOn: updatedOn ?? this.updatedOn,
      projectConceptMasterId: projectConceptMasterId ?? this.projectConceptMasterId,
      fsProposalMasterId: fsProposalMasterId ?? this.fsProposalMasterId,
      currentStage: currentStage ?? this.currentStage,
      movementTime: movementTime ?? this.movementTime,
      dppMasterId: dppMasterId ?? this.dppMasterId,
      tappMasterId: tappMasterId ?? this.tappMasterId,
      rdppMasterId: rdppMasterId ?? this.rdppMasterId,
      rtappMasterId: rtappMasterId ?? this.rtappMasterId,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'uuid': uuid});
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }
    if (createdBy != null) {
      result.addAll({'createdBy': createdBy});
    }
    if (createdOn != null) {
      result.addAll({'createdOn': createdOn});
    }
    if (updatedBy != null) {
      result.addAll({'updatedBy': updatedBy});
    }
    if (updatedOn != null) {
      result.addAll({'updatedOn': updatedOn});
    }
    if (projectConceptMasterId != null) {
      result.addAll({'projectConceptMasterId': projectConceptMasterId});
    }
    if (fsProposalMasterId != null) {
      result.addAll({'fsProposalMasterId': fsProposalMasterId});
    }
    if (currentStage != null) {
      result.addAll({'currentStage': currentStage});
    }
    if (movementTime != null) {
      result.addAll({'movementTime': movementTime});
    }
    if (dppMasterId != null) {
      result.addAll({'dppMasterId': dppMasterId});
    }
    if (tappMasterId != null) {
      result.addAll({'tappMasterId': tappMasterId});
    }
    if (rdppMasterId != null) {
      result.addAll({'rdppMasterId': rdppMasterId});
    }
    if (rtappMasterId != null) {
      result.addAll({'rtappMasterId': rtappMasterId});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }

    return result;
  }

  factory ProjectMovementState.fromMap(Map<String, dynamic> map) {
    return ProjectMovementState(
      id: map['id']?.toInt() ?? 0,
      uuid: map['uuid'] ?? '',
      isDeleted: map['isDeleted'],
      createdBy: map['createdBy'],
      createdOn: map['createdOn'],
      updatedBy: map['updatedBy'],
      updatedOn: map['updatedOn'],
      projectConceptMasterId: map['projectConceptMasterId'],
      fsProposalMasterId: map['fsProposalMasterId'],
      currentStage: map['currentStage'],
      movementTime: map['movementTime'],
      dppMasterId: map['dppMasterId'],
      tappMasterId: map['tappMasterId'],
      rdppMasterId: map['rdppMasterId'],
      rtappMasterId: map['rtappMasterId'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectMovementState.fromJson(String source) => ProjectMovementState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProjectMovementState(id: $id, uuid: $uuid, isDeleted: $isDeleted, createdBy: $createdBy, createdOn: $createdOn, updatedBy: $updatedBy, updatedOn: $updatedOn, projectConceptMasterId: $projectConceptMasterId, fsProposalMasterId: $fsProposalMasterId, currentStage: $currentStage, movementTime: $movementTime, dppMasterId: $dppMasterId, tappMasterId: $tappMasterId, rdppMasterId: $rdppMasterId, rtappMasterId: $rtappMasterId, userId: $userId)';
  }
}

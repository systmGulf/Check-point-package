// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assign_shifts_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignShiftsRequestBody _$AssignShiftsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AssignShiftsRequestBody(
      shiftId: (json['shiftId'] as num).toInt(),
      branchesIds: (json['branchesIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$AssignShiftsRequestBodyToJson(
        AssignShiftsRequestBody instance) =>
    <String, dynamic>{
      'shiftId': instance.shiftId,
      'branchesIds': instance.branchesIds,
    };

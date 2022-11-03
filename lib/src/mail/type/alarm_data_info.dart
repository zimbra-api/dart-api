// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'alarm_info.dart';

class AlarmDataInfo {
  /// Time in millis to show the alarm
  final int? nextAlarm;

  /// Start time of the meeting instance the alarm is reminding about
  final int? alarmInstanceStart;

  /// Mail Item ID of the invite message with detailed information
  final int? invId;

  /// Component number
  final int? componentNum;

  /// Meeting subject
  final String? name;

  /// Meeting location
  final String? location;

  /// Details of the alarm
  final AlarmInfo? alarm;

  AlarmDataInfo({
    this.nextAlarm,
    this.alarmInstanceStart,
    this.invId,
    this.componentNum,
    this.name,
    this.location,
    this.alarm,
  });

  factory AlarmDataInfo.fromMap(Map<String, dynamic> data) => AlarmDataInfo(
      nextAlarm: data['nextAlarm'],
      alarmInstanceStart: data['alarmInstStart'],
      invId: data['invId'],
      componentNum: data['compNum'],
      name: data['name'],
      location: data['loc'],
      alarm: data['alarm'] is Map ? AlarmInfo.fromMap(data['alarm']) : null);

  Map<String, dynamic> toMap() => {
        if (nextAlarm != null) 'nextAlarm': nextAlarm,
        if (alarmInstanceStart != null) 'alarmInstStart': alarmInstanceStart,
        if (invId != null) 'invId': invId,
        if (componentNum != null) 'compNum': componentNum,
        if (name != null) 'name': name,
        if (location != null) 'loc': location,
        if (alarm != null) 'alarm': alarm!.toMap(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'alarm_data_info.dart';

class UpdatedAlarmInfo {
  /// Calendar item ID
  final String calItemId;

  /// Updated alarm information
  final AlarmDataInfo? alarmData;

  const UpdatedAlarmInfo(this.calItemId, {this.alarmData});

  factory UpdatedAlarmInfo.fromMap(Map<String, dynamic> data) => UpdatedAlarmInfo(data['calItemId'],
      alarmData: data['alarmData'] is Map ? AlarmDataInfo.fromMap(data['alarmData']) : null);

  Map<String, dynamic> toMap() => {
        'calItemId': calItemId,
        if (alarmData != null) 'alarmData': alarmData!.toMap(),
      };
}

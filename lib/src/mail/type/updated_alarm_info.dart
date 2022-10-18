// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'alarm_data_info.dart';

class UpdatedAlarmInfo {
  /// Calendar item ID
  final String calItemId;

  /// Updated alarm information
  final AlarmDataInfo? alarmData;

  UpdatedAlarmInfo(this.calItemId, {this.alarmData});

  factory UpdatedAlarmInfo.fromJson(Map<String, dynamic> json) => UpdatedAlarmInfo(json['calItemId'],
      alarmData: json['alarmData'] is Map ? AlarmDataInfo.fromJson(json['alarmData']) : null);

  Map<String, dynamic> toJson() => {
        'calItemId': calItemId,
        if (alarmData != null) 'alarmData': alarmData!.toJson(),
      };
}

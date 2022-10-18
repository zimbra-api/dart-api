// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/updated_alarm_info.dart';

class DismissCalendarItemAlarmResponse extends SoapResponse {
  /// Updated appointment alarm information
  final List<UpdatedAlarmInfo> apptUpdatedAlarms;

  /// Updated task alarm information
  final List<UpdatedAlarmInfo> taskUpdatedAlarms;

  DismissCalendarItemAlarmResponse({this.apptUpdatedAlarms = const [], this.taskUpdatedAlarms = const []});

  factory DismissCalendarItemAlarmResponse.fromJson(Map<String, dynamic> json) => DismissCalendarItemAlarmResponse(
      apptUpdatedAlarms: (json['appt'] is Iterable)
          ? List.from((json['appt'] as Iterable).map<UpdatedAlarmInfo>((appt) => UpdatedAlarmInfo.fromJson(appt)))
          : [],
      taskUpdatedAlarms: (json['task'] is Iterable)
          ? List.from((json['task'] as Iterable).map<UpdatedAlarmInfo>((task) => UpdatedAlarmInfo.fromJson(task)))
          : []);
}

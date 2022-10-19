// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/calendar_item_info.dart';
import 'package:zimbra_api/src/mail/type/task_item_info.dart';

class GetAppointmentResponse extends SoapResponse {
  /// Appointment information
  final CalendarItemInfo? appt;

  ///Task information
  final TaskItemInfo? task;

  GetAppointmentResponse({this.appt, this.task});

  factory GetAppointmentResponse.fromJson(Map<String, dynamic> json) => GetAppointmentResponse(
      appt: json['appt'] is Map ? CalendarItemInfo.fromJson(json['appt']) : null,
      task: json['task'] is Map ? TaskItemInfo.fromJson(json['task']) : null);
}

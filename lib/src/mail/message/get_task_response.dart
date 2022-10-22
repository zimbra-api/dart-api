// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/mail/type/calendar_item_info.dart';
import 'package:zimbra_api/src/mail/type/task_item_info.dart';

import 'get_appointment_response.dart';

class GetTaskResponse extends GetAppointmentResponse {
  GetTaskResponse({super.appt, super.task});

  factory GetTaskResponse.fromJson(Map<String, dynamic> json) => GetTaskResponse(
      appt: json['appt'] is Map ? CalendarItemInfo.fromJson(json['appt']) : null,
      task: json['task'] is Map ? TaskItemInfo.fromJson(json['task']) : null);
}

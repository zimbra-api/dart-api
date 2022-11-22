// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../type/calendar_item_info.dart';
import '../type/task_item_info.dart';
import 'get_appointment_response.dart';

class GetTaskResponse extends GetAppointmentResponse {
  GetTaskResponse({super.appt, super.task});

  factory GetTaskResponse.fromMap(Map<String, dynamic> data) => GetTaskResponse(
      appt: data['appt'] is Map ? CalendarItemInfo.fromMap(data['appt']) : null,
      task: data['task'] is Map ? TaskItemInfo.fromMap(data['task']) : null);
}

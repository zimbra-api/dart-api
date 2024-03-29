// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/calendar_item_info.dart';
import '../type/task_item_info.dart';

class GetAppointmentResponse extends SoapResponse {
  /// Appointment information
  final CalendarItemInfo? appt;

  ///Task information
  final TaskItemInfo? task;

  GetAppointmentResponse({this.appt, this.task});

  factory GetAppointmentResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetAppointmentResponse(
        appt: data['appt'] is Map
            ? CalendarItemInfo.fromMap(
                data['appt'],
              )
            : null,
        task: data['task'] is Map
            ? TaskItemInfo.fromMap(
                data['task'],
              )
            : null,
      );
}

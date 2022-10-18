// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/mail/type/cal_echo.dart';
import 'package:zimbra_api/src/mail/type/create_calendar_item_response.dart';

/// Contains response information for create task exception
class CreateTaskExceptionResponse extends CreateCalendarItemResponse {
  CreateTaskExceptionResponse(
      {super.calItemId,
      super.deprecatedApptId,
      super.calInvId,
      super.modifiedSequence,
      super.revision,
      super.msg,
      super.echo});

  factory CreateTaskExceptionResponse.fromJson(Map<String, dynamic> json) => CreateTaskExceptionResponse(
      calItemId: json['calItemId'],
      deprecatedApptId: json['apptId'],
      calInvId: json['invId'],
      modifiedSequence: json['ms'],
      revision: json['rev'],
      msg: json['m'] is Map ? Id.fromJson(json['m']) : null,
      echo: json['echo'] is Map ? CalEcho.fromJson(json['echo']) : null);
}
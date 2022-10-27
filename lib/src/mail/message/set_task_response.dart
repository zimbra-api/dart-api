// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/mail/type/except_id_info.dart';

import 'set_appointment_response.dart';

class SetTaskResponse extends SetAppointmentResponse {
  SetTaskResponse({super.calItemId, super.deprecatedApptId, super.defaultId, super.exceptions = const []});

  factory SetTaskResponse.fromJson(Map<String, dynamic> json) => SetTaskResponse(
      calItemId: json['calItemId'],
      deprecatedApptId: json['apptId'],
      defaultId: json['default'] is Map ? Id.fromJson(json['default']) : null,
      exceptions: (json['except'] is Iterable)
          ? List.from((json['except'] as Iterable).map<ExceptIdInfo>((except) => ExceptIdInfo.fromJson(except)))
          : []);
}

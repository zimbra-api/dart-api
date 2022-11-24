// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/id.dart';
import '../type/except_id_info.dart';
import 'set_appointment_response.dart';

class SetTaskResponse extends SetAppointmentResponse {
  SetTaskResponse({
    super.calItemId,
    super.deprecatedApptId,
    super.defaultId,
    super.exceptions = const [],
  });

  factory SetTaskResponse.fromMap(Map<String, dynamic> data) => SetTaskResponse(
      calItemId: data['calItemId'],
      deprecatedApptId: data['apptId'],
      defaultId: data['default'] is Map ? Id.fromMap(data['default']) : null,
      exceptions: (data['except'] is Iterable)
          ? (data['except'] as Iterable)
              .map<ExceptIdInfo>((except) => ExceptIdInfo.fromMap(except))
              .toList(growable: false)
          : const []);
}

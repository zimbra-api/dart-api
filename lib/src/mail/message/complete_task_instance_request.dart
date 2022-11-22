// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/cal_tz_info.dart';
import '../type/dt_time_info.dart';
import 'complete_task_instance_body.dart';
import 'complete_task_instance_envelope.dart';

/// Complete a task instance
class CompleteTaskInstanceRequest extends SoapRequest {
  /// ID
  final String id;

  /// Exception ID
  final DtTimeInfo exceptionId;

  /// Timezone information
  final CalTZInfo? timezone;

  CompleteTaskInstanceRequest(this.id, this.exceptionId, {this.timezone});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CompleteTaskInstanceEnvelope(CompleteTaskInstanceBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'id': id,
        'exceptId': exceptionId.toMap(),
        if (timezone != null) 'tz': timezone!.toMap(),
      };
}

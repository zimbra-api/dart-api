// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'cancel_appointment_request.dart';
import 'cancel_task_body.dart';
import 'cancel_task_envelope.dart';

// Cancel task request
class CancelTaskRequest extends CancelAppointmentRequest {
  CancelTaskRequest({
    super.id,
    super.componentNum,
    super.modifiedSequence,
    super.revision,
    super.instance,
    super.timezone,
    super.msg,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => CancelTaskEnvelope(
        CancelTaskBody(request: this),
        header: header,
      );
}

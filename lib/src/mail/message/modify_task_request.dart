// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'modify_appointment_request.dart';
import 'modify_task_body.dart';
import 'modify_task_envelope.dart';

/// Modify task
class ModifyTaskRequest extends ModifyAppointmentRequest {
  ModifyTaskRequest(
      {super.id,
      super.componentNum,
      super.modifiedSequence,
      super.revision,
      super.echo,
      super.maxSize,
      super.wantHtml,
      super.neuter,
      super.forceSend,
      super.msg});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => ModifyTaskEnvelope(ModifyTaskBody(request: this), header: header);
}

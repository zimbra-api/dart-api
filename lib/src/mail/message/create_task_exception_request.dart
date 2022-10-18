// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'create_appointment_exception_request.dart';
import 'create_task_exception_body.dart';
import 'create_task_exception_envelope.dart';

/// Create task exception.
class CreateTaskExceptionRequest extends CreateAppointmentExceptionRequest {
  CreateTaskExceptionRequest({super.echo, super.maxSize, super.wantHtml, super.neuter, super.forceSend, super.msg});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CreateTaskExceptionEnvelope(CreateTaskExceptionBody(request: this), header: header);
}

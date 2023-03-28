// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'create_appointment_request.dart';
import 'create_task_body.dart';
import 'create_task_envelope.dart';

/// This is the API to create a new Task
class CreateTaskRequest extends CreateAppointmentRequest {
  CreateTaskRequest({
    super.echo,
    super.maxSize,
    super.wantHtml,
    super.neuter,
    super.forceSend,
    super.msg,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => CreateTaskEnvelope(
        CreateTaskBody(request: this),
        header: header,
      );
}

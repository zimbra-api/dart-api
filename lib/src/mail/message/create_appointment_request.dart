// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../type/cal_item_request_base.dart';
import 'create_appointment_body.dart';
import 'create_appointment_envelope.dart';

/// This is the API to create a new Appointment, optionally  sending out meeting
/// Invitations to other people.
class CreateAppointmentRequest extends CalItemRequestBase {
  CreateAppointmentRequest({
    super.echo,
    super.maxSize,
    super.wantHtml,
    super.neuter,
    super.forceSend,
    super.msg,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CreateAppointmentEnvelope(CreateAppointmentBody(request: this), header: header);
}

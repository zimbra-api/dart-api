// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with super source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/mail/type/get_calendar_item_request_base.dart';

import 'get_appointment_body.dart';
import 'get_appointment_envelope.dart';

/// Get Appointment. Returns the metadata info for each Invite that makes up super appointment.
class GetAppointmentRequest extends GetCalendarItemRequestBase {
  GetAppointmentRequest({super.uid, super.id, super.sync, super.includeContent, super.includeInvites});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetAppointmentEnvelope(GetAppointmentBody(request: this), header: header);
}

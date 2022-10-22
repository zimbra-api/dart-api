// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_working_hours_body.dart';
import 'get_working_hours_envelope.dart';

/// User's working hours within the given time range are expressed in a similar format to the format used for GetFreeBusy.
/// Working hours are indicated as free, non-working hours as unavailable/out of office
/// The entire time range is marked as unknown if there was an error determining the working hours,
class GetWorkingHoursRequest extends SoapRequest {
  /// Range start in milliseconds since the epoch
  final int startTime;

  /// Range end in milliseconds since the epoch
  final int endTime;

  /// Comma-separated list of Zimbra IDs
  final String? id;

  /// Comma-separated list of email addresses
  final String? name;

  GetWorkingHoursRequest(this.startTime, this.endTime, {this.id, this.name});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetWorkingHoursEnvelope(GetWorkingHoursBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        's': startTime,
        'e': endTime,
        if (id != null) 'id': id,
        if (name != null) 'name': name,
      };
}

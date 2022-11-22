// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'get_ical_body.dart';
import 'get_ical_envelope.dart';

/// Retrieve the unparsed (but XML-encoded) iCalendar data for an Invite
/// This is intended for interfacing with 3rd party programs
/// If <id> attribute specified, gets the iCalendar representation for one invite
/// If <id> attribute is not specified, then start/end MUST be, Calendar data is returned for entire specified range
class GetICalRequest extends SoapRequest {
  /// If specified, gets the iCalendar representation for one invite
  final String? id;

  /// Range start in milliseconds
  final int? startTime;

  /// Range end in milliseconds
  final int? endTime;

  GetICalRequest({this.id, this.startTime, this.endTime});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetICalEnvelope(GetICalBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (id != null) 'id': id,
        if (startTime != null) 's': startTime,
        if (endTime != null) 'e': endTime,
      };
}

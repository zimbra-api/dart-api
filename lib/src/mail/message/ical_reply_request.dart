// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'ical_reply_body.dart';
import 'ical_reply_envelope.dart';

/// Do an iCalendar Reply
class ICalReplyRequest extends SoapRequest {
  /// iCalendar text containing components with method REPLY
  final String ical;

  ICalReplyRequest(this.ical);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => ICalReplyEnvelope(
        ICalReplyBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'ical': {'_content': ical},
      };
}

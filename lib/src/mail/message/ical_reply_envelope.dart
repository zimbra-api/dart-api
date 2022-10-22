// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'ical_reply_body.dart';

class ICalReplyEnvelope extends SoapEnvelope {
  ICalReplyEnvelope(ICalReplyBody body, {super.header}) : super(body);

  factory ICalReplyEnvelope.fromJson(Map<String, dynamic> json) =>
      ICalReplyEnvelope(ICalReplyBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ICalReplyBody get iCalReplyBody => body as ICalReplyBody;
}

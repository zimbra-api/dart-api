// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'record_imap_session_body.dart';

class RecordIMAPSessionEnvelope extends SoapEnvelope {
  RecordIMAPSessionEnvelope(RecordIMAPSessionBody body, {super.header}) : super(body);

  factory RecordIMAPSessionEnvelope.fromJson(Map<String, dynamic> json) =>
      RecordIMAPSessionEnvelope(RecordIMAPSessionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  RecordIMAPSessionBody get recordIMAPSessionBody => body as RecordIMAPSessionBody;
}

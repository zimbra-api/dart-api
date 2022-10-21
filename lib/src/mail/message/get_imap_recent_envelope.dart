// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_imap_recent_body.dart';

class GetIMAPRecentEnvelope extends SoapEnvelope {
  GetIMAPRecentEnvelope(GetIMAPRecentBody body, {super.header}) : super(body);

  factory GetIMAPRecentEnvelope.fromJson(Map<String, dynamic> json) =>
      GetIMAPRecentEnvelope(GetIMAPRecentBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetIMAPRecentBody get getIMAPRecentBody => body as GetIMAPRecentBody;
}

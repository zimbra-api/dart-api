// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_imap_recent_cutoff_body.dart';

class GetIMAPRecentCutoffEnvelope extends SoapEnvelope {
  GetIMAPRecentCutoffEnvelope(GetIMAPRecentCutoffBody body, {super.header}) : super(body);

  factory GetIMAPRecentCutoffEnvelope.fromJson(Map<String, dynamic> json) =>
      GetIMAPRecentCutoffEnvelope(GetIMAPRecentCutoffBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetIMAPRecentCutoffBody get getIMAPRecentCutoffBody => body as GetIMAPRecentCutoffBody;
}
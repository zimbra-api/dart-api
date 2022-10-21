// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_appt_summaries_body.dart';

class GetApptSummariesEnvelope extends SoapEnvelope {
  GetApptSummariesEnvelope(GetApptSummariesBody body, {super.header}) : super(body);

  factory GetApptSummariesEnvelope.fromJson(Map<String, dynamic> json) =>
      GetApptSummariesEnvelope(GetApptSummariesBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetApptSummariesBody get getApptSummariesBody => body as GetApptSummariesBody;
}
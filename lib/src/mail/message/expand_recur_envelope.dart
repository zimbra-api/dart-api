// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'expand_recur_body.dart';

class ExpandRecurEnvelope extends SoapEnvelope {
  ExpandRecurEnvelope(ExpandRecurBody body, {super.header}) : super(body);

  factory ExpandRecurEnvelope.fromJson(Map<String, dynamic> json) =>
      ExpandRecurEnvelope(ExpandRecurBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ExpandRecurBody get expandRecurBody => body as ExpandRecurBody;
}

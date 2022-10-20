// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_filter_rules_body.dart';

class GetFilterRulesEnvelope extends SoapEnvelope {
  GetFilterRulesEnvelope(GetFilterRulesBody body, {super.header}) : super(body);

  factory GetFilterRulesEnvelope.fromJson(Map<String, dynamic> json) =>
      GetFilterRulesEnvelope(GetFilterRulesBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetFilterRulesBody get getFilterRulesBody => body as GetFilterRulesBody;
}

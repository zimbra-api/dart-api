// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_outgoing_filter_rules_body.dart';

class GetOutgoingFilterRulesEnvelope extends SoapEnvelope {
  GetOutgoingFilterRulesEnvelope(GetOutgoingFilterRulesBody body, {super.header}) : super(body);

  factory GetOutgoingFilterRulesEnvelope.fromJson(Map<String, dynamic> json) =>
      GetOutgoingFilterRulesEnvelope(GetOutgoingFilterRulesBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetOutgoingFilterRulesBody get getOutgoingFilterRulesBody => body as GetOutgoingFilterRulesBody;
}
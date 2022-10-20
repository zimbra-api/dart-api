// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_filter_rules_body.dart';
import 'get_filter_rules_envelope.dart';

/// Get filter rules
class GetFilterRulesRequest extends SoapRequest {
  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetFilterRulesEnvelope(GetFilterRulesBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
      };
}

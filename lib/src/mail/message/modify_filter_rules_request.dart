// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/filter_rule.dart';

import 'modify_filter_rules_body.dart';
import 'modify_filter_rules_envelope.dart';

/// Modify filter rules
class ModifyFilterRulesRequest extends SoapRequest {
  /// Filter rules
  final List<FilterRule> filterRules;

  ModifyFilterRulesRequest(this.filterRules);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ModifyFilterRulesEnvelope(ModifyFilterRulesBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (filterRules.isNotEmpty)
          'filterRules': {'filterRule': filterRules.map((filterRule) => filterRule.toMap()).toList()},
      };
}

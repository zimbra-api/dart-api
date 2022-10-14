// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/named_element.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/ids_attr.dart';

import 'apply_filter_rules_body.dart';
import 'apply_filter_rules_envelope.dart';

/// Applies one or more filter rules to messages specified by a comma-separated ID list, or returned by a search query.
/// One or the other can be specified, but not both.  Returns the list of ids of existing messages that were affected.
/// Note that redirect actions are ignored when applying filter rules to existing messages.
class ApplyFilterRulesRequest extends SoapRequest {
  /// Filter rules
  final List<NamedElement> filterRules;

  /// Comma-separated list of message IDs
  final IdsAttr? msgIds;

  /// Query string
  final String? query;

  ApplyFilterRulesRequest({this.filterRules = const [], this.msgIds, this.query});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ApplyFilterRulesEnvelope(ApplyFilterRulesBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        if (filterRules.isNotEmpty)
          'filterRules': {'filterRule': filterRules.map((filterRule) => filterRule.toJson()).toList()},
        if (msgIds != null) 'm': msgIds!.toJson(),
        if (query != null) 'query': {'_content': query},
      };
}

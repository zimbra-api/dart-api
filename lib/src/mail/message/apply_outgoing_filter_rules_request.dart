// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'apply_filter_rules_request.dart';
import 'apply_outgoing_filter_rules_body.dart';
import 'apply_outgoing_filter_rules_envelope.dart';

/// Applies one or more filter rules to messages specified by a comma-separated ID list, or returned by a search query.
/// One or the other can be specified, but not both.  Returns the list of ids of existing messages that were affected.
/// Note that redirect actions are ignored when applying filter rules to existing messages.
class ApplyOutgoingFilterRulesRequest extends ApplyFilterRulesRequest {
  ApplyOutgoingFilterRulesRequest({super.filterRules, super.msgIds, super.query});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ApplyOutgoingFilterRulesEnvelope(ApplyOutgoingFilterRulesBody(request: this), header: header);
}

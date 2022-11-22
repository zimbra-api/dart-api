// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'modify_filter_rules_request.dart';
import 'modify_outgoing_filter_rules_body.dart';
import 'modify_outgoing_filter_rules_envelope.dart';

/// Modify outgoing filter rules
class ModifyOutgoingFilterRulesRequest extends ModifyFilterRulesRequest {
  ModifyOutgoingFilterRulesRequest(super.filterRules);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ModifyOutgoingFilterRulesEnvelope(ModifyOutgoingFilterRulesBody(request: this), header: header);
}

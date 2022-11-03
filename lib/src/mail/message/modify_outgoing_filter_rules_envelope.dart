// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'modify_outgoing_filter_rules_body.dart';

class ModifyOutgoingFilterRulesEnvelope extends SoapEnvelope {
  ModifyOutgoingFilterRulesEnvelope(ModifyOutgoingFilterRulesBody body, {super.header}) : super(body);

  factory ModifyOutgoingFilterRulesEnvelope.fromMap(Map<String, dynamic> data) =>
      ModifyOutgoingFilterRulesEnvelope(ModifyOutgoingFilterRulesBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  ModifyOutgoingFilterRulesBody get modifyOutgoingFilterRulesBody => body as ModifyOutgoingFilterRulesBody;
}

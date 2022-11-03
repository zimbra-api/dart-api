// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_outgoing_filter_rules_request.dart';
import 'modify_outgoing_filter_rules_response.dart';

class ModifyOutgoingFilterRulesBody extends SoapBody {
  ModifyOutgoingFilterRulesBody(
      {ModifyOutgoingFilterRulesRequest? request, ModifyOutgoingFilterRulesResponse? response, super.fault})
      : super(request: request, response: response);

  factory ModifyOutgoingFilterRulesBody.fromMap(Map<String, dynamic> data) => ModifyOutgoingFilterRulesBody(
      response: data['ModifyOutgoingFilterRulesResponse'] != null
          ? ModifyOutgoingFilterRulesResponse.fromMap(data['ModifyOutgoingFilterRulesResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  ModifyOutgoingFilterRulesRequest? get modifyOutgoingFilterRulesRequest =>
      request as ModifyOutgoingFilterRulesRequest?;

  ModifyOutgoingFilterRulesResponse? get modifyOutgoingFilterRulesResponse =>
      response as ModifyOutgoingFilterRulesResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyOutgoingFilterRulesRequest': request!.toMap(),
      };
}

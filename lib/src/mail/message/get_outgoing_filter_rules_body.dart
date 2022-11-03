// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_outgoing_filter_rules_request.dart';
import 'get_outgoing_filter_rules_response.dart';

class GetOutgoingFilterRulesBody extends SoapBody {
  GetOutgoingFilterRulesBody(
      {GetOutgoingFilterRulesRequest? request, GetOutgoingFilterRulesResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetOutgoingFilterRulesBody.fromMap(Map<String, dynamic> data) => GetOutgoingFilterRulesBody(
      response: data['GetOutgoingFilterRulesResponse'] != null
          ? GetOutgoingFilterRulesResponse.fromMap(data['GetOutgoingFilterRulesResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetOutgoingFilterRulesRequest': request!.toMap(),
      };
}

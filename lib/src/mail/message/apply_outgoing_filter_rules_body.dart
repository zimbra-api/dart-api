// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'apply_outgoing_filter_rules_request.dart';
import 'apply_outgoing_filter_rules_response.dart';

class ApplyOutgoingFilterRulesBody extends SoapBody {
  ApplyOutgoingFilterRulesBody(
      {ApplyOutgoingFilterRulesRequest? request, ApplyOutgoingFilterRulesResponse? response, super.fault})
      : super(request: request, response: response);

  factory ApplyOutgoingFilterRulesBody.fromJson(Map<String, dynamic> json) => ApplyOutgoingFilterRulesBody(
      response: json['ApplyOutgoingFilterRulesResponse'] != null
          ? ApplyOutgoingFilterRulesResponse.fromJson(json['ApplyOutgoingFilterRulesResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ApplyOutgoingFilterRulesRequest? get applyOutgoingFilterRulesRequest => request as ApplyOutgoingFilterRulesRequest?;

  ApplyOutgoingFilterRulesResponse? get applyOutgoingFilterRulesResponse =>
      response as ApplyOutgoingFilterRulesResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ApplyOutgoingFilterRulesRequest': request!.toJson(),
      };
}

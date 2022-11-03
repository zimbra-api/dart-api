// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'apply_filter_rules_request.dart';
import 'apply_filter_rules_response.dart';

class ApplyFilterRulesBody extends SoapBody {
  ApplyFilterRulesBody({ApplyFilterRulesRequest? request, ApplyFilterRulesResponse? response, super.fault})
      : super(request: request, response: response);

  factory ApplyFilterRulesBody.fromMap(Map<String, dynamic> data) => ApplyFilterRulesBody(
      response: data['ApplyFilterRulesResponse'] != null
          ? ApplyFilterRulesResponse.fromMap(data['ApplyFilterRulesResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  ApplyFilterRulesRequest? get applyFilterRulesRequest => request as ApplyFilterRulesRequest?;

  ApplyFilterRulesResponse? get applyFilterRulesResponse => response as ApplyFilterRulesResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ApplyFilterRulesRequest': request!.toMap(),
      };
}

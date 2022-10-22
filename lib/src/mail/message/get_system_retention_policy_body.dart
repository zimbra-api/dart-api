// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_system_retention_policy_request.dart';
import 'get_system_retention_policy_response.dart';

class GetSystemRetentionPolicyBody extends SoapBody {
  GetSystemRetentionPolicyBody(
      {GetSystemRetentionPolicyRequest? request, GetSystemRetentionPolicyResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetSystemRetentionPolicyBody.fromJson(Map<String, dynamic> json) => GetSystemRetentionPolicyBody(
      response: json['GetSystemRetentionPolicyResponse'] != null
          ? GetSystemRetentionPolicyResponse.fromJson(json['GetSystemRetentionPolicyResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetSystemRetentionPolicyRequest? get getSystemRetentionPolicyRequest => request as GetSystemRetentionPolicyRequest?;

  GetSystemRetentionPolicyResponse? get getSystemRetentionPolicyResponse =>
      response as GetSystemRetentionPolicyResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetSystemRetentionPolicyRequest': request!.toJson(),
      };
}

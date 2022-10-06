// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'revoke_oauth_consumer_request.dart';
import 'revoke_oauth_consumer_response.dart';

class RevokeOAuthConsumerBody extends SoapBody {
  RevokeOAuthConsumerBody({RevokeOAuthConsumerRequest? request, RevokeOAuthConsumerResponse? response, super.fault})
      : super(request: request, response: response);

  factory RevokeOAuthConsumerBody.fromJson(Map<String, dynamic> json) => RevokeOAuthConsumerBody(
      response: json['RevokeOAuthConsumerResponse'] != null
          ? RevokeOAuthConsumerResponse.fromJson(json['RevokeOAuthConsumerResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  RevokeOAuthConsumerRequest? get revokeOAuthConsumerRequest => request as RevokeOAuthConsumerRequest;

  RevokeOAuthConsumerResponse? get revokeOAuthConsumerResponse => response as RevokeOAuthConsumerResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'RevokeOAuthConsumerRequest': request!.toJson(),
      };
}

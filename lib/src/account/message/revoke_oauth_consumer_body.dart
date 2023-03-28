// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'revoke_oauth_consumer_request.dart';
import 'revoke_oauth_consumer_response.dart';

class RevokeOAuthConsumerBody extends SoapBody {
  RevokeOAuthConsumerBody({
    RevokeOAuthConsumerRequest? request,
    RevokeOAuthConsumerResponse? response,
  }) : super(request: request, response: response);

  factory RevokeOAuthConsumerBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      RevokeOAuthConsumerBody(
        response: data['RevokeOAuthConsumerResponse'] != null
            ? RevokeOAuthConsumerResponse.fromMap(
                data['RevokeOAuthConsumerResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'RevokeOAuthConsumerRequest': request!.toMap(),
      };
}

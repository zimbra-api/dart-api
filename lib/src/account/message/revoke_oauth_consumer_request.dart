// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import 'revoke_oauth_consumer_body.dart';
import 'revoke_oauth_consumer_envelope.dart';

class RevokeOAuthConsumerRequest extends SoapRequest {
  final String accessToken;

  RevokeOAuthConsumerRequest(this.accessToken);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => RevokeOAuthConsumerEnvelope(
        RevokeOAuthConsumerBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        'accessToken': accessToken,
      };
}

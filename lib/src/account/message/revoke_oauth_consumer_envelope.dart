// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'revoke_oauth_consumer_body.dart';

class RevokeOAuthConsumerEnvelope extends SoapEnvelope {
  RevokeOAuthConsumerEnvelope(RevokeOAuthConsumerBody body, {SoapHeader? header}) : super(body, header: header);

  factory RevokeOAuthConsumerEnvelope.fromJson(Map<String, dynamic> json) =>
      RevokeOAuthConsumerEnvelope(RevokeOAuthConsumerBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  RevokeOAuthConsumerBody get revokeOAuthConsumerBody => body as RevokeOAuthConsumerBody;
}

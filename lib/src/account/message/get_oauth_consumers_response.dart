// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/oauth_consumer.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetOAuthConsumersResponse extends SoapResponse {
  /// Consumers
  final List<OAuthConsumer> consumers;

  GetOAuthConsumersResponse({this.consumers = const []});

  factory GetOAuthConsumersResponse.fromJson(Map<String, dynamic> json) => GetOAuthConsumersResponse(
      consumers: (json['OAuthConsumer'] is Iterable)
          ? List.from(
              (json['OAuthConsumer'] as Iterable).map<OAuthConsumer>((consumer) => OAuthConsumer.fromJson(consumer)))
          : []);
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/oauth_consumer.dart';

class GetOAuthConsumersResponse extends SoapResponse {
  /// Consumers
  final List<OAuthConsumer> consumers;

  GetOAuthConsumersResponse({this.consumers = const []});

  factory GetOAuthConsumersResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetOAuthConsumersResponse(
        consumers: (data['OAuthConsumer'] is Iterable)
            ? (data['OAuthConsumer'] as Iterable)
                .map<OAuthConsumer>(
                  (consumer) => OAuthConsumer.fromMap(consumer),
                )
                .toList(growable: false)
            : const [],
      );
}

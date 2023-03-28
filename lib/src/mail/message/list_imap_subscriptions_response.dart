// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class ListIMAPSubscriptionsResponse extends SoapResponse {
  /// List of folder paths subscribed via IMAP
  final List<String> subscriptions;

  ListIMAPSubscriptionsResponse({this.subscriptions = const []});

  factory ListIMAPSubscriptionsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      ListIMAPSubscriptionsResponse(
        subscriptions: (data['sub'] is Iterable)
            ? (data['sub'] as Iterable)
                .map<String>(
                  (dictionary) => dictionary['_content'],
                )
                .toList(growable: false)
            : const [],
      );
}

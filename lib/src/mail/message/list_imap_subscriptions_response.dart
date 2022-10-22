// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class ListIMAPSubscriptionsResponse extends SoapResponse {
  /// List of folder paths subscribed via IMAP
  final List<String> subscriptions;

  ListIMAPSubscriptionsResponse({this.subscriptions = const []});

  factory ListIMAPSubscriptionsResponse.fromJson(Map<String, dynamic> json) => ListIMAPSubscriptionsResponse(
      subscriptions: (json['sub'] is Iterable)
          ? List.from((json['sub'] as Iterable).map<String>((dictionary) => dictionary['_content']))
          : []);
}

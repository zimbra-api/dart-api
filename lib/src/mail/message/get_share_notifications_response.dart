// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/share_notification_info.dart';

class GetShareNotificationsResponse extends SoapResponse {
  /// Share notification information
  final List<ShareNotificationInfo> shares;

  GetShareNotificationsResponse({this.shares = const []});

  factory GetShareNotificationsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetShareNotificationsResponse(
        shares: (data['share'] is Iterable)
            ? (data['share'] as Iterable)
                .map<ShareNotificationInfo>(
                  (share) => ShareNotificationInfo.fromMap(share),
                )
                .toList(growable: false)
            : const [],
      );
}

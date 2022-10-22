// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/share_notification_info.dart';

class GetShareNotificationsResponse extends SoapResponse {
  /// Share notification information
  final List<ShareNotificationInfo> shares;

  GetShareNotificationsResponse({this.shares = const []});

  factory GetShareNotificationsResponse.fromJson(Map<String, dynamic> json) => GetShareNotificationsResponse(
      shares: (json['share'] is Iterable)
          ? List.from(
              (json['share'] as Iterable).map<ShareNotificationInfo>((share) => ShareNotificationInfo.fromJson(share)))
          : []);
}

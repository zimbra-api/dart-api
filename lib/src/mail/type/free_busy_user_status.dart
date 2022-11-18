// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/free_busy_status.dart';

/// Free/Busy user status
class FreeBusyUserStatus {
  /// Email address for a user who has a conflict with the instance
  final String? name;

  /// Free/Busy status - B|T|O (Busy, Tentative or Out-of-office)
  final FreeBusyStatus? freebusyStatus;

  const FreeBusyUserStatus({this.name, this.freebusyStatus});

  factory FreeBusyUserStatus.fromMap(Map<String, dynamic> data) => FreeBusyUserStatus(
      name: data['name'],
      freebusyStatus: FreeBusyStatus.values.firstWhere(
        (item) => item.name == data['fb'],
        orElse: () => FreeBusyStatus.free,
      ));

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (freebusyStatus != null) 'fb': freebusyStatus!.name,
      };
}

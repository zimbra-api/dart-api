// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/free_busy_user_info.dart';

class GetWorkingHoursResponse extends SoapResponse {
  /// Working hours information by user
  final List<FreeBusyUserInfo> freebusyUsers;

  GetWorkingHoursResponse({this.freebusyUsers = const []});

  factory GetWorkingHoursResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetWorkingHoursResponse(
        freebusyUsers: (data['usr'] is Iterable)
            ? (data['usr'] as Iterable)
                .map<FreeBusyUserInfo>(
                  (usr) => FreeBusyUserInfo.fromMap(usr),
                )
                .toList(growable: false)
            : const [],
      );
}

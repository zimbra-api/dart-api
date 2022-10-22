// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/free_busy_user_info.dart';

class GetWorkingHoursResponse extends SoapResponse {
  /// Working hours information by user
  final List<FreeBusyUserInfo> freebusyUsers;

  GetWorkingHoursResponse({this.freebusyUsers = const []});

  factory GetWorkingHoursResponse.fromJson(Map<String, dynamic> json) => GetWorkingHoursResponse(
      freebusyUsers: (json['usr'] is Iterable)
          ? List.from((json['usr'] as Iterable).map<FreeBusyUserInfo>((usr) => FreeBusyUserInfo.fromJson(usr)))
          : []);
}

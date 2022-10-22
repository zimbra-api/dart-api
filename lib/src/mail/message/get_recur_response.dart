// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/cal_tz_info.dart';
import 'package:zimbra_api/src/mail/type/calendar_item_recur.dart';

class GetRecurResponse extends SoapResponse {
  /// Invite recurrence component
  final CalendarItemRecur? inviteComponent;

  /// Timezone
  final CalTZInfo? timezone;

  /// Cancel recurrence component
  final CalendarItemRecur? cancelComponent;

  /// Except recurrence component
  final CalendarItemRecur? exceptComponent;

  GetRecurResponse({this.timezone, this.inviteComponent, this.cancelComponent, this.exceptComponent});

  factory GetRecurResponse.fromJson(Map<String, dynamic> json) => GetRecurResponse(
      timezone: json['tz'] is Map ? CalTZInfo.fromJson(json['tz']) : null,
      inviteComponent: json['comp'] is Map ? CalendarItemRecur.fromJson(json['comp']) : null,
      cancelComponent: json['cancel'] is Map ? CalendarItemRecur.fromJson(json['cancel']) : null,
      exceptComponent: json['except'] is Map ? CalendarItemRecur.fromJson(json['except']) : null);
}

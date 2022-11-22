// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/cal_tz_info.dart';
import '../type/calendar_item_recur.dart';

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

  factory GetRecurResponse.fromMap(Map<String, dynamic> data) => GetRecurResponse(
      timezone: data['tz'] is Map ? CalTZInfo.fromMap(data['tz']) : null,
      inviteComponent: data['comp'] is Map ? CalendarItemRecur.fromMap(data['comp']) : null,
      cancelComponent: data['cancel'] is Map ? CalendarItemRecur.fromMap(data['cancel']) : null,
      exceptComponent: data['except'] is Map ? CalendarItemRecur.fromMap(data['except']) : null);
}

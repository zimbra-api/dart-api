// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/id.dart';
import '../../common/type/soap_response.dart';
import 'cal_echo.dart';

/// Contains response information for calendar actions (create, modify, reply)
class CreateCalendarItemResponse extends SoapResponse {
  /// Appointment ID
  final String? calItemId;

  /// Appointment ID (deprecated)
  final String? deprecatedApptId;

  /// Invite Message ID
  final String? calInvId;

  /// Change sequence
  final int? modifiedSequence;

  /// Revision
  final int? revision;

  /// Message information
  final Id? msg;

  /// Included if "echo" was set in the request
  final CalEcho? echo;

  CreateCalendarItemResponse(
      {this.calItemId,
      this.deprecatedApptId,
      this.calInvId,
      this.modifiedSequence,
      this.revision,
      this.msg,
      this.echo});
}

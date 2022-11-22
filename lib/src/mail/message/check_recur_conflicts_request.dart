// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/cal_tz_info.dart';
import '../type/expanded_recurrence_cancel.dart';
import '../type/expanded_recurrence_exception.dart';
import '../type/expanded_recurrence_invite.dart';
import '../type/free_busy_user_spec.dart';
import 'check_recur_conflicts_body.dart';
import 'check_recur_conflicts_envelope.dart';

/// Check conflicts in recurrence against list of users.
/// Set {all} attribute to get all instances, even those without conflicts.
/// By default only instances that have conflicts are returned.
class CheckRecurConflictsRequest extends SoapRequest {
  /// Start time in millis. If not specified, defaults to current time
  final int? startTime;

  /// End time in millis. If not specified, unlimited
  final int? endTime;

  /// Set this to get all instances, even those without conflicts.
  /// By default only instances that have conflicts are returned.
  final bool? allInstances;

  /// UID of appointment to exclude from free/busy search
  final String? excludeUid;

  /// Timezones
  final List<CalTZInfo> timezones;

  /// Cancel expanded recurrences
  final List<ExpandedRecurrenceCancel> cancelComponents;

  /// Invite expanded recurrences
  final List<ExpandedRecurrenceInvite> inviteComponents;

  /// Except expanded recurrences
  final List<ExpandedRecurrenceException> exceptComponents;

  /// Freebusy user specifications
  final List<FreeBusyUserSpec> freebusyUsers;

  CheckRecurConflictsRequest(
      {this.startTime,
      this.endTime,
      this.allInstances,
      this.excludeUid,
      this.timezones = const [],
      this.cancelComponents = const [],
      this.inviteComponents = const [],
      this.exceptComponents = const [],
      this.freebusyUsers = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CheckRecurConflictsEnvelope(CheckRecurConflictsBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (startTime != null) 's': startTime,
        if (endTime != null) 'e': endTime,
        if (allInstances != null) 'all': allInstances,
        if (excludeUid != null) 'excludeUid': excludeUid,
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toMap()).toList(growable: false),
        if (cancelComponents.isNotEmpty)
          'cancel': cancelComponents.map((cancel) => cancel.toMap()).toList(growable: false),
        if (inviteComponents.isNotEmpty) 'comp': inviteComponents.map((comp) => comp.toMap()).toList(growable: false),
        if (exceptComponents.isNotEmpty)
          'except': exceptComponents.map((except) => except.toMap()).toList(growable: false),
        if (freebusyUsers.isNotEmpty) 'usr': freebusyUsers.map((usr) => usr.toMap()).toList(growable: false),
      };
}

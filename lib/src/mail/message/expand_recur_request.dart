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
import 'expand_recur_body.dart';
import 'expand_recur_envelope.dart';

/// Expand recurrences
class ExpandRecurRequest extends SoapRequest {
  /// Start time in milliseconds
  final int startTime;

  /// End time in milliseconds
  final int endTime;

  /// Timezone definitions
  final List<CalTZInfo> timezones;

  /// Specifications for series, modified instances and canceled instances
  final List<ExpandedRecurrenceInvite> inviteComponents;

  /// Specifications for series, modified instances and canceled instances
  final List<ExpandedRecurrenceException> exceptComponents;

  /// Specifications for series, modified instances and canceled instances
  final List<ExpandedRecurrenceCancel> cancelComponents;

  ExpandRecurRequest(
    this.startTime,
    this.endTime, {
    this.timezones = const [],
    this.inviteComponents = const [],
    this.exceptComponents = const [],
    this.cancelComponents = const [],
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => ExpandRecurEnvelope(
        ExpandRecurBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        's': startTime,
        'e': endTime,
        if (timezones.isNotEmpty)
          'tz': timezones
              .map(
                (tz) => tz.toMap(),
              )
              .toList(growable: false),
        if (cancelComponents.isNotEmpty)
          'cancel': cancelComponents
              .map(
                (cancel) => cancel.toMap(),
              )
              .toList(growable: false),
        if (inviteComponents.isNotEmpty)
          'comp': inviteComponents
              .map(
                (comp) => comp.toMap(),
              )
              .toList(growable: false),
        if (exceptComponents.isNotEmpty)
          'except': exceptComponents
              .map(
                (except) => except.toMap(),
              )
              .toList(growable: false),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/cal_reply.dart';
import '../type/set_calendar_item_info.dart';
import 'set_appointment_body.dart';
import 'set_appointment_envelope.dart';

/// Directly set status of an entire appointment. This API is intended for mailbox
/// Migration (ie migrating a mailbox onto this server) and is not used by normal mail clients.
/// Need to specify folder for appointment
/// Need way to add message WITHOUT processing it for calendar parts.
/// Need to generate and patch-in the iCalendar for the <inv> but w/o actually processing the <inv> as a new request
class SetAppointmentRequest extends SoapRequest {
  /// Flags
  final String? flags;

  /// Tags (Deprecated - use {tag-names} instead)
  final String? tags;

  /// Comma separated list of tag names
  final String? tagNames;

  /// ID of folder to create appointment in
  final String? folderId;

  /// Set if all alarms have been dismissed; if this is set, nextAlarm should not be set
  final bool? noNextAlarm;

  /// If specified, time when next alarm should go off.
  /// If missing, two possibilities:
  /// - if noNextAlarm isn't set, keep current next alarm time (this is a backward compatibility case)
  /// - if noNextAlarm is set, indicates all alarms have been dismissed
  final int? nextAlarm;

  ///Default calendar item information
  final SetCalendarItemInfo? defaultId;

  /// Calendar item information for exceptions
  final List<SetCalendarItemInfo> exceptions;

  /// Calendar item information for cancellations
  final List<SetCalendarItemInfo> cancellations;

  /// List of replies received from attendees.
  /// If SetAppointmenRequest doesn't contain a <replies> block, existing replies will be kept.
  /// If <replies> element is provided with no <reply> elements inside,
  /// existing replies will be removed, replaced with an empty set.
  /// If <replies> contains one or more <reply> elements, existing replies are replaced with the ones provided.
  final List<CalReply> replies;

  SetAppointmentRequest({
    this.flags,
    this.tags,
    this.tagNames,
    this.folderId,
    this.noNextAlarm,
    this.nextAlarm,
    this.defaultId,
    this.exceptions = const [],
    this.cancellations = const [],
    this.replies = const [],
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => SetAppointmentEnvelope(
        SetAppointmentBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (folderId != null) 'l': folderId,
        if (noNextAlarm != null) 'noNextAlarm': noNextAlarm,
        if (nextAlarm != null) 'nextAlarm': nextAlarm,
        if (defaultId != null) 'default': defaultId!.toMap(),
        if (exceptions.isNotEmpty)
          'except': exceptions
              .map(
                (except) => except.toMap(),
              )
              .toList(growable: false),
        if (cancellations.isNotEmpty)
          'cancel': cancellations
              .map(
                (cancel) => cancel.toMap(),
              )
              .toList(growable: false),
        if (replies.isNotEmpty)
          'replies': [
            {
              'reply': replies
                  .map(
                    (reply) => reply.toMap(),
                  )
                  .toList(growable: false),
            }
          ],
      };
}

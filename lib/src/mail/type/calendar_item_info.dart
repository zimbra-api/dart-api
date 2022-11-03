// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'calendar_reply.dart';
import 'invitation.dart';
import 'mail_custom_metadata.dart';

class CalendarItemInfo {
  /// Flags
  final String? flags;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma separated list of tag names
  final String? tagNames;

  /// iCalendar UID
  final String? uid;

  /// Appointment ID
  final String? id;

  /// Revision number
  final int? revision;

  /// Size
  final int? size;

  /// Date
  final int? date;

  /// Folder ID
  final String? folder;

  /// Modified date in seconds
  final int? changeDate;

  /// Modified sequence
  final int? modifiedSequence;

  /// Next alarm time
  final int? nextAlarm;

  /// Has exceptions but no series
  final bool? orphan;

  /// Invites
  final List<Invitation> invites;

  /// Replies
  final List<CalendarReply> calendarReplies;

  /// Metadata
  final List<MailCustomMetadata> metadatas;

  CalendarItemInfo(
      {this.flags,
      this.tags,
      this.tagNames,
      this.uid,
      this.id,
      this.revision,
      this.size,
      this.date,
      this.folder,
      this.changeDate,
      this.modifiedSequence,
      this.nextAlarm,
      this.orphan,
      this.invites = const [],
      this.calendarReplies = const [],
      this.metadatas = const []});

  factory CalendarItemInfo.fromMap(Map<String, dynamic> data) => CalendarItemInfo(
      flags: data['f'],
      tags: data['t'],
      tagNames: data['tn'],
      uid: data['uid'],
      id: data['id'],
      revision: data['rev'],
      size: data['s'],
      date: data['d'],
      folder: data['l'],
      changeDate: data['md'],
      modifiedSequence: data['ms'],
      nextAlarm: data['nextAlarm'],
      orphan: data['orphan'],
      invites: (data['inv'] is Iterable)
          ? List.from((data['inv'] as Iterable).map<Invitation>((inv) => Invitation.fromMap(inv)))
          : [],
      calendarReplies: (data['replies']?['reply'] is Iterable)
          ? List.from(
              (data['replies']['reply'] as Iterable).map<CalendarReply>((reply) => CalendarReply.fromMap(reply)))
          : [],
      metadatas: (data['meta'] is Iterable)
          ? List.from((data['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta)))
          : []);

  Map<String, dynamic> toMap() => {
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (uid != null) 'uid': uid,
        if (id != null) 'id': id,
        if (revision != null) 'rev': revision,
        if (size != null) 's': size,
        if (date != null) 'd': date,
        if (folder != null) 'l': folder,
        if (changeDate != null) 'md': changeDate,
        if (modifiedSequence != null) 'ms': modifiedSequence,
        if (nextAlarm != null) 'nextAlarm': nextAlarm,
        if (orphan != null) 'orphan': orphan,
        if (invites.isNotEmpty) 'inv': invites.map((inv) => inv.toMap()).toList(),
        if (calendarReplies.isNotEmpty) 'replies': {'reply': calendarReplies.map((reply) => reply.toMap()).toList()},
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toMap()).toList(),
      };
}

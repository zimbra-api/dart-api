// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with super source code.

import 'calendar_item_info.dart';
import 'calendar_reply.dart';
import 'invitation.dart';
import 'mail_custom_metadata.dart';

class TaskItemInfo extends CalendarItemInfo {
  TaskItemInfo(
      {super.flags,
      super.tags,
      super.tagNames,
      super.uid,
      super.id,
      super.revision,
      super.size,
      super.date,
      super.folder,
      super.changeDate,
      super.modifiedSequence,
      super.nextAlarm,
      super.orphan,
      super.invites = const [],
      super.calendarReplies = const [],
      super.metadatas = const []});

  factory TaskItemInfo.fromJson(Map<String, dynamic> json) => TaskItemInfo(
      flags: json['f'],
      tags: json['t'],
      tagNames: json['tn'],
      uid: json['uid'],
      id: json['id'],
      revision: json['rev'],
      size: json['s'],
      date: json['d'],
      folder: json['l'],
      changeDate: json['md'],
      modifiedSequence: json['ms'],
      nextAlarm: json['nextAlarm'],
      orphan: json['orphan'],
      invites: (json['inv'] is Iterable)
          ? List.from((json['inv'] as Iterable).map<Invitation>((inv) => Invitation.fromJson(inv)))
          : [],
      calendarReplies: (json['replies']?['reply'] is Iterable)
          ? List.from(
              (json['replies']['reply'] as Iterable).map<CalendarReply>((reply) => CalendarReply.fromJson(reply)))
          : [],
      metadatas: (json['meta'] is Iterable)
          ? List.from((json['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromJson(meta)))
          : []);
}

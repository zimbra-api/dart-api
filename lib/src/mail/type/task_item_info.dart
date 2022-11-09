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

  factory TaskItemInfo.fromMap(Map<String, dynamic> data) => TaskItemInfo(
      flags: data['f'],
      tags: data['t'],
      tagNames: data['tn'],
      uid: data['uid'],
      id: data['id'],
      revision: int.tryParse(data['rev']?.toString() ?? ''),
      size: int.tryParse(data['s']?.toString() ?? ''),
      date: int.tryParse(data['d']?.toString() ?? ''),
      folder: data['l'],
      changeDate: int.tryParse(data['md']?.toString() ?? ''),
      modifiedSequence: int.tryParse(data['ms']?.toString() ?? ''),
      nextAlarm: int.tryParse(data['nextAlarm']?.toString() ?? ''),
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
}

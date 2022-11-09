// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/calendar_item_info.dart';
import 'package:zimbra_api/src/mail/type/chat_summary.dart';
import 'package:zimbra_api/src/mail/type/common_document_info.dart';
import 'package:zimbra_api/src/mail/type/contact_info.dart';
import 'package:zimbra_api/src/mail/type/conversation_summary.dart';
import 'package:zimbra_api/src/mail/type/document_info.dart';
import 'package:zimbra_api/src/mail/type/message_summary.dart';
import 'package:zimbra_api/src/mail/type/note_info.dart';
import 'package:zimbra_api/src/mail/type/sync_deleted_info.dart';
import 'package:zimbra_api/src/mail/type/sync_folder.dart';
import 'package:zimbra_api/src/mail/type/tag_info.dart';
import 'package:zimbra_api/src/mail/type/task_item_info.dart';

class SyncResponse extends SoapResponse {
  /// Change date
  final int? changeDate;

  /// New sync token
  final String? token;

  /// size
  final int? size;

  /// If set, the response does not bring the client completely up to date.
  /// More changes are still queued, and another SyncRequest (using the new returned token) is necessary.
  final bool? more;

  /// Information on deletes
  final SyncDeletedInfo? deleted;

  /// Sync folder items
  final List<SyncFolder> folderItems;

  /// Tag items
  final List<TagInfo> tagItems;

  /// Note items
  final List<NoteInfo> noteItems;

  /// Contact items
  final List<ContactInfo> contactItems;

  /// Calendar items
  final List<CalendarItemInfo> apptItems;

  /// Task items
  final List<TaskItemInfo> taskItems;

  /// Conversation items
  final List<ConversationSummary> convItems;

  /// Wiki items
  final List<CommonDocumentInfo> wikiItems;

  /// Document items
  final List<DocumentInfo> docItems;

  /// Message items
  final List<MessageSummary> msgItems;

  /// Chat items
  final List<ChatSummary> chatItems;

  SyncResponse(
      {this.changeDate,
      this.token,
      this.size,
      this.more,
      this.deleted,
      this.folderItems = const [],
      this.tagItems = const [],
      this.noteItems = const [],
      this.contactItems = const [],
      this.apptItems = const [],
      this.taskItems = const [],
      this.convItems = const [],
      this.wikiItems = const [],
      this.docItems = const [],
      this.msgItems = const [],
      this.chatItems = const []});

  factory SyncResponse.fromMap(Map<String, dynamic> data) => SyncResponse(
      changeDate: int.tryParse(data['md']?.toString() ?? ''),
      token: data['token'],
      size: int.tryParse(data['s']?.toString() ?? ''),
      more: data['more'],
      deleted: data['deleted'] is Map ? SyncDeletedInfo.fromMap(data['deleted']) : null,
      folderItems: (data['folder'] is Iterable)
          ? List.from((data['folder'] as Iterable).map<SyncFolder>((folder) => SyncFolder.fromMap(folder)))
          : [],
      tagItems: (data['tag'] is Iterable)
          ? List.from((data['tag'] as Iterable).map<TagInfo>((tag) => TagInfo.fromMap(tag)))
          : [],
      noteItems: (data['note'] is Iterable)
          ? List.from((data['note'] as Iterable).map<NoteInfo>((note) => NoteInfo.fromMap(note)))
          : [],
      contactItems: (data['cn'] is Iterable)
          ? List.from((data['cn'] as Iterable).map<ContactInfo>((cn) => ContactInfo.fromMap(cn)))
          : [],
      apptItems: (data['appt'] is Iterable)
          ? List.from((data['appt'] as Iterable).map<CalendarItemInfo>((appt) => CalendarItemInfo.fromMap(appt)))
          : [],
      taskItems: (data['task'] is Iterable)
          ? List.from((data['task'] as Iterable).map<TaskItemInfo>((task) => TaskItemInfo.fromMap(task)))
          : [],
      convItems: (data['c'] is Iterable)
          ? List.from((data['c'] as Iterable).map<ConversationSummary>((conv) => ConversationSummary.fromMap(conv)))
          : [],
      wikiItems: (data['w'] is Iterable)
          ? List.from((data['w'] as Iterable).map<CommonDocumentInfo>((wiki) => CommonDocumentInfo.fromMap(wiki)))
          : [],
      docItems: (data['doc'] is Iterable)
          ? List.from((data['doc'] as Iterable).map<DocumentInfo>((doc) => DocumentInfo.fromMap(doc)))
          : [],
      msgItems: (data['m'] is Iterable)
          ? List.from((data['m'] as Iterable).map<MessageSummary>((msg) => MessageSummary.fromMap(msg)))
          : [],
      chatItems: (data['chat'] is Iterable)
          ? List.from((data['chat'] as Iterable).map<ChatSummary>((chat) => ChatSummary.fromMap(chat)))
          : []);
}

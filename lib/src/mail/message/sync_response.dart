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

  factory SyncResponse.fromJson(Map<String, dynamic> json) => SyncResponse(
      changeDate: json['md'],
      token: json['token'],
      size: json['s'],
      more: json['more'],
      deleted: json['deleted'] is Map ? SyncDeletedInfo.fromJson(json['deleted']) : null,
      folderItems: (json['folder'] is Iterable)
          ? List.from((json['folder'] as Iterable).map<SyncFolder>((folder) => SyncFolder.fromJson(folder)))
          : [],
      tagItems: (json['tag'] is Iterable)
          ? List.from((json['tag'] as Iterable).map<TagInfo>((tag) => TagInfo.fromJson(tag)))
          : [],
      noteItems: (json['note'] is Iterable)
          ? List.from((json['note'] as Iterable).map<NoteInfo>((note) => NoteInfo.fromJson(note)))
          : [],
      contactItems: (json['cn'] is Iterable)
          ? List.from((json['cn'] as Iterable).map<ContactInfo>((cn) => ContactInfo.fromJson(cn)))
          : [],
      apptItems: (json['appt'] is Iterable)
          ? List.from((json['appt'] as Iterable).map<CalendarItemInfo>((appt) => CalendarItemInfo.fromJson(appt)))
          : [],
      taskItems: (json['task'] is Iterable)
          ? List.from((json['task'] as Iterable).map<TaskItemInfo>((task) => TaskItemInfo.fromJson(task)))
          : [],
      convItems: (json['c'] is Iterable)
          ? List.from((json['c'] as Iterable).map<ConversationSummary>((conv) => ConversationSummary.fromJson(conv)))
          : [],
      wikiItems: (json['w'] is Iterable)
          ? List.from((json['w'] as Iterable).map<CommonDocumentInfo>((wiki) => CommonDocumentInfo.fromJson(wiki)))
          : [],
      docItems: (json['doc'] is Iterable)
          ? List.from((json['doc'] as Iterable).map<DocumentInfo>((doc) => DocumentInfo.fromJson(doc)))
          : [],
      msgItems: (json['m'] is Iterable)
          ? List.from((json['m'] as Iterable).map<MessageSummary>((msg) => MessageSummary.fromJson(msg)))
          : [],
      chatItems: (json['chat'] is Iterable)
          ? List.from((json['chat'] as Iterable).map<ChatSummary>((chat) => ChatSummary.fromJson(chat)))
          : []);
}

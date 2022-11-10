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
          ? (data['folder'] as Iterable).map<SyncFolder>((folder) => SyncFolder.fromMap(folder)).toList(growable: false)
          : const [],
      tagItems: (data['tag'] is Iterable)
          ? (data['tag'] as Iterable).map<TagInfo>((tag) => TagInfo.fromMap(tag)).toList(growable: false)
          : const [],
      noteItems: (data['note'] is Iterable)
          ? (data['note'] as Iterable).map<NoteInfo>((note) => NoteInfo.fromMap(note)).toList(growable: false)
          : const [],
      contactItems: (data['cn'] is Iterable)
          ? (data['cn'] as Iterable).map<ContactInfo>((cn) => ContactInfo.fromMap(cn)).toList(growable: false)
          : const [],
      apptItems: (data['appt'] is Iterable)
          ? (data['appt'] as Iterable)
              .map<CalendarItemInfo>((appt) => CalendarItemInfo.fromMap(appt))
              .toList(growable: false)
          : const [],
      taskItems: (data['task'] is Iterable)
          ? (data['task'] as Iterable).map<TaskItemInfo>((task) => TaskItemInfo.fromMap(task)).toList(growable: false)
          : const [],
      convItems: (data['c'] is Iterable)
          ? (data['c'] as Iterable)
              .map<ConversationSummary>((conv) => ConversationSummary.fromMap(conv))
              .toList(growable: false)
          : const [],
      wikiItems: (data['w'] is Iterable)
          ? (data['w'] as Iterable)
              .map<CommonDocumentInfo>((wiki) => CommonDocumentInfo.fromMap(wiki))
              .toList(growable: false)
          : const [],
      docItems: (data['doc'] is Iterable)
          ? (data['doc'] as Iterable).map<DocumentInfo>((doc) => DocumentInfo.fromMap(doc)).toList(growable: false)
          : const [],
      msgItems: (data['m'] is Iterable)
          ? (data['m'] as Iterable).map<MessageSummary>((msg) => MessageSummary.fromMap(msg)).toList(growable: false)
          : const [],
      chatItems: (data['chat'] is Iterable)
          ? (data['chat'] as Iterable).map<ChatSummary>((chat) => ChatSummary.fromMap(chat)).toList(growable: false)
          : const []);
}

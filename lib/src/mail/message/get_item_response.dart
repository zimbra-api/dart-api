// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/calendar_item_info.dart';
import '../type/chat_summary.dart';
import '../type/common_document_info.dart';
import '../type/contact_info.dart';
import '../type/conversation_summary.dart';
import '../type/document_info.dart';
import '../type/folder.dart';
import '../type/message_summary.dart';
import '../type/note_info.dart';
import '../type/tag_info.dart';
import '../type/task_item_info.dart';

class GetItemResponse extends SoapResponse {
  /// Folder item
  final Folder? folderItem;

  /// Tag item
  final TagInfo? tagItem;

  /// Note item
  final NoteInfo? noteItem;

  /// Contact item
  final ContactInfo? contactItem;

  /// Calendar item
  final CalendarItemInfo? apptItem;

  /// Task item
  final TaskItemInfo? taskItem;

  /// Conversation item
  final ConversationSummary? convItem;

  /// Wiki item
  final CommonDocumentInfo? wikiItem;

  /// Document item
  final DocumentInfo? docItem;

  /// Message item
  final MessageSummary? msgItem;

  /// Chat item
  final ChatSummary? chatItem;

  GetItemResponse(
      {this.folderItem,
      this.tagItem,
      this.noteItem,
      this.contactItem,
      this.apptItem,
      this.taskItem,
      this.convItem,
      this.wikiItem,
      this.docItem,
      this.msgItem,
      this.chatItem});

  factory GetItemResponse.fromMap(Map<String, dynamic> data) => GetItemResponse(
      folderItem: (data['folder'] is Map) ? Folder.fromMap(data['folder']) : null,
      tagItem: (data['tag'] is Map) ? TagInfo.fromMap(data['tag']) : null,
      noteItem: (data['note'] is Map) ? NoteInfo.fromMap(data['note']) : null,
      contactItem: (data['cn'] is Map) ? ContactInfo.fromMap(data['cn']) : null,
      apptItem: (data['appt'] is Map) ? CalendarItemInfo.fromMap(data['appt']) : null,
      taskItem: (data['task'] is Map) ? TaskItemInfo.fromMap(data['task']) : null,
      convItem: (data['c'] is Map) ? ConversationSummary.fromMap(data['c']) : null,
      wikiItem: (data['w'] is Map) ? CommonDocumentInfo.fromMap(data['w']) : null,
      docItem: (data['doc'] is Map) ? DocumentInfo.fromMap(data['doc']) : null,
      msgItem: (data['m'] is Map) ? MessageSummary.fromMap(data['m']) : null,
      chatItem: (data['chat'] is Map) ? ChatSummary.fromMap(data['chat']) : null);
}

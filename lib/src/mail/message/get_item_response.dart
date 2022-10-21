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
import 'package:zimbra_api/src/mail/type/folder.dart';
import 'package:zimbra_api/src/mail/type/message_summary.dart';
import 'package:zimbra_api/src/mail/type/note_info.dart';
import 'package:zimbra_api/src/mail/type/tag_info.dart';
import 'package:zimbra_api/src/mail/type/task_item_info.dart';

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

  factory GetItemResponse.fromJson(Map<String, dynamic> json) => GetItemResponse(
      folderItem: (json['folder'] is Map) ? Folder.fromJson(json['folder']) : null,
      tagItem: (json['tag'] is Map) ? TagInfo.fromJson(json['tag']) : null,
      noteItem: (json['note'] is Map) ? NoteInfo.fromJson(json['note']) : null,
      contactItem: (json['cn'] is Map) ? ContactInfo.fromJson(json['cn']) : null,
      apptItem: (json['appt'] is Map) ? CalendarItemInfo.fromJson(json['appt']) : null,
      taskItem: (json['task'] is Map) ? TaskItemInfo.fromJson(json['task']) : null,
      convItem: (json['c'] is Map) ? ConversationSummary.fromJson(json['c']) : null,
      wikiItem: (json['w'] is Map) ? CommonDocumentInfo.fromJson(json['w']) : null,
      docItem: (json['doc'] is Map) ? DocumentInfo.fromJson(json['doc']) : null,
      msgItem: (json['m'] is Map) ? MessageSummary.fromJson(json['m']) : null,
      chatItem: (json['chat'] is Map) ? ChatSummary.fromJson(json['chat']) : null);
}

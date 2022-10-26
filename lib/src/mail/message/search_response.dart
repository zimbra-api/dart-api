// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/search_sort_by.dart';
import 'package:zimbra_api/src/common/type/simple_search_hit.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/calendar_item_hit_info.dart';
import 'package:zimbra_api/src/mail/type/contact_info.dart';
import 'package:zimbra_api/src/mail/type/conversation_hit_info.dart';
import 'package:zimbra_api/src/mail/type/document_hit_info.dart';
import 'package:zimbra_api/src/mail/type/message_hit_info.dart';
import 'package:zimbra_api/src/mail/type/message_part_hit_info.dart';
import 'package:zimbra_api/src/mail/type/note_hit_info.dart';
import 'package:zimbra_api/src/mail/type/search_query_info.dart';
import 'package:zimbra_api/src/mail/type/wiki_hit_info.dart';

class SearchResponse extends SoapResponse {
  /// What to sort by. Default is "dateDesc"
  /// Possible values:
  /// none|dateAsc|dateDesc|subjAsc|subjDesc|nameAsc|nameDesc|rcptAsc|rcptDesc|attachAsc|attachDesc|
  /// flagAsc|flagDesc|priorityAsc|priorityDesc|idAsc|idDesc|readAsc|readDesc
  /// If sort-by is "none" then queryInfos MUST NOT be used, and some searches are impossible
  /// (searches that require intersection of complex sub-ops).
  /// Server will throw an IllegalArgumentException if the search is invalid.
  /// ADDITIONAL SORT MODES FOR TASKS: valid only if types="task" (and task alone):
  /// taskDueAsc|taskDueDesc|taskStatusAsc|taskStatusDesc|taskPercCompletedAsc|taskPercCompletedDesc
  final SearchSortBy? sortBy;

  /// Offset - an int specifying the 0-based offset into the results list returned as
  /// the first result for this search operation.
  final int? queryOffset;

  /// Set if there are more search results remaining.
  final bool? queryMore;

  /// All messages
  final int? totalSize;

  /// Simple search hits
  final List<SimpleSearchHit> simpleHits;

  /// Conversation search hits
  final List<ConversationHitInfo> conversationHits;

  /// Message search hits
  final List<MessageHitInfo> messageHits;

  /// Chat search hits
  final List<MessageHitInfo> chatHits;

  /// Message part search hits
  final List<MessagePartHitInfo> messagePartHits;

  /// Contact search hits
  final List<ContactInfo> contactHits;

  /// Note search hits
  final List<NoteHitInfo> noteHits;

  /// Document search hits
  final List<DocumentHitInfo> documentHits;

  /// Wiki search hits
  final List<WikiHitInfo> wikiHits;

  /// Appointment search hits
  final List<CalendarItemHitInfo> appointmentHits;

  /// Task search hits
  final List<CalendarItemHitInfo> taskHits;

  /// Used to return general status information about your search.
  /// The <wildcard> element tells you about the status of wildcard expansions within your search.
  /// If expanded is set, then the wildcard was expanded and the matches are included in the search.
  /// If expanded is unset then the wildcard was not specific enough and therefore no wildcard matches are included
  /// (exact-match is included in results).
  final SearchQueryInfo? queryInfo;

  SearchResponse(
      {this.sortBy,
      this.queryOffset,
      this.queryMore,
      this.totalSize,
      this.simpleHits = const [],
      this.conversationHits = const [],
      this.messageHits = const [],
      this.chatHits = const [],
      this.messagePartHits = const [],
      this.contactHits = const [],
      this.noteHits = const [],
      this.documentHits = const [],
      this.wikiHits = const [],
      this.appointmentHits = const [],
      this.taskHits = const [],
      this.queryInfo});

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
      sortBy: SearchSortBy.values.firstWhere(
        (sortBy) => sortBy.name == json['sortBy'],
        orElse: () => SearchSortBy.dateDesc,
      ),
      queryOffset: json['offset'],
      queryMore: json['more'],
      totalSize: json['total'],
      simpleHits: (json['hit'] is Iterable)
          ? List.from((json['hit'] as Iterable).map<SimpleSearchHit>((hit) => SimpleSearchHit.fromJson(hit)))
          : [],
      conversationHits: (json['c'] is Iterable)
          ? List.from((json['c'] as Iterable).map<ConversationHitInfo>((c) => ConversationHitInfo.fromJson(c)))
          : [],
      messageHits: (json['m'] is Iterable)
          ? List.from((json['m'] as Iterable).map<MessageHitInfo>((m) => MessageHitInfo.fromJson(m)))
          : [],
      chatHits: (json['chat'] is Iterable)
          ? List.from((json['chat'] as Iterable).map<MessageHitInfo>((chat) => MessageHitInfo.fromJson(chat)))
          : [],
      messagePartHits: (json['mp'] is Iterable)
          ? List.from((json['mp'] as Iterable).map<MessagePartHitInfo>((mp) => MessagePartHitInfo.fromJson(mp)))
          : [],
      contactHits: (json['cn'] is Iterable)
          ? List.from((json['cn'] as Iterable).map<ContactInfo>((cn) => ContactInfo.fromJson(cn)))
          : [],
      noteHits: (json['note'] is Iterable)
          ? List.from((json['note'] as Iterable).map<NoteHitInfo>((note) => NoteHitInfo.fromJson(note)))
          : [],
      documentHits: (json['doc'] is Iterable)
          ? List.from((json['doc'] as Iterable).map<DocumentHitInfo>((doc) => DocumentHitInfo.fromJson(doc)))
          : [],
      wikiHits: (json['w'] is Iterable)
          ? List.from((json['w'] as Iterable).map<WikiHitInfo>((w) => WikiHitInfo.fromJson(w)))
          : [],
      appointmentHits: (json['appt'] is Iterable)
          ? List.from((json['appt'] as Iterable).map<CalendarItemHitInfo>((appt) => CalendarItemHitInfo.fromJson(appt)))
          : [],
      taskHits: (json['task'] is Iterable)
          ? List.from((json['task'] as Iterable).map<CalendarItemHitInfo>((task) => CalendarItemHitInfo.fromJson(task)))
          : [],
      queryInfo: json['info'] is Map ? SearchQueryInfo.fromJson(json['info']) : null);
}

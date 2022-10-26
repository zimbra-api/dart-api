// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/search_sort_by.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/message_hit_info.dart';
import 'package:zimbra_api/src/mail/type/nested_search_conversation.dart';
import 'package:zimbra_api/src/mail/type/search_query_info.dart';

class SearchConvResponse extends SoapResponse {
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

  /// Nested Search Conversation (Only returned if request had "nest" attribute set)
  final NestedSearchConversation? conversation;

  /// Message search hits
  final List<MessageHitInfo> messages;

  /// Used to return general status information about your search.
  /// The <wildcard> element tells you about the status of wildcard expansions within your search.
  /// If expanded is set, then the wildcard was expanded and the matches are included in the search.
  /// If expanded is unset then the wildcard was not specific enough and therefore no wildcard matches are included
  /// (exact-match is included in results).
  final SearchQueryInfo? queryInfo;

  SearchConvResponse(
      {this.sortBy, this.queryOffset, this.queryMore, this.conversation, this.messages = const [], this.queryInfo});

  factory SearchConvResponse.fromJson(Map<String, dynamic> json) => SearchConvResponse(
      sortBy: SearchSortBy.values.firstWhere(
        (sortBy) => sortBy.name == json['sortBy'],
        orElse: () => SearchSortBy.dateDesc,
      ),
      queryOffset: json['offset'],
      queryMore: json['more'],
      conversation: json['c'] is Map ? NestedSearchConversation.fromJson(json['c']) : null,
      messages: (json['m'] is Iterable)
          ? List.from((json['m'] as Iterable).map<MessageHitInfo>((m) => MessageHitInfo.fromJson(m)))
          : [],
      queryInfo: json['info'] is Map ? SearchQueryInfo.fromJson(json['info']) : null);
}

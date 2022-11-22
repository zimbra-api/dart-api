// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/search_sort_by.dart';
import '../../common/type/soap_response.dart';
import '../type/message_hit_info.dart';
import '../type/nested_search_conversation.dart';
import '../type/search_query_info.dart';

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

  SearchConvResponse({
    this.sortBy,
    this.queryOffset,
    this.queryMore,
    this.conversation,
    this.messages = const [],
    this.queryInfo,
  });

  factory SearchConvResponse.fromMap(Map<String, dynamic> data) => SearchConvResponse(
      sortBy: SearchSortBy.values.firstWhere(
        (sortBy) => sortBy.name == data['sortBy'],
        orElse: () => SearchSortBy.dateDesc,
      ),
      queryOffset: int.tryParse(data['offset']?.toString() ?? ''),
      queryMore: data['more'],
      conversation: data['c'] is Map ? NestedSearchConversation.fromMap(data['c']) : null,
      messages: (data['m'] is Iterable)
          ? (data['m'] as Iterable).map<MessageHitInfo>((m) => MessageHitInfo.fromMap(m)).toList(growable: false)
          : const [],
      queryInfo: data['info']?[0] is Map ? SearchQueryInfo.fromMap(data['info'][0]) : null);
}

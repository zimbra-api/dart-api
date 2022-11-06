// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'message_hit_info.dart';
import 'search_query_info.dart';

class NestedSearchConversation {
  /// Conversation ID
  final String? id;

  /// Number of messages in conversation without IMAP \Deleted flag set
  final int? num;

  /// Total number of messages in conversation
  final int? totalSize;

  /// Same flags as on <m> ("sarwfdxnu!?"), aggregated from all the conversation's messages
  final String? flags;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma-separated list of tag names
  final String? tagNames;

  /// Message search hits
  final List<MessageHitInfo> messages;

  /// Info block.  Used to return general status information about your search.
  /// The <wildcard> element tells you about the status of wildcard expansions within your search.
  /// If expanded is set, then the wildcard was expanded and the matches are included in the search.
  /// If expanded is unset then the wildcard was not specific enough and therefore no wildcard matches are included
  /// (exact-match is included in results).
  final SearchQueryInfo? queryInfo;

  NestedSearchConversation(
      {this.id,
      this.num,
      this.totalSize,
      this.flags,
      this.tags,
      this.tagNames,
      this.messages = const [],
      this.queryInfo});

  factory NestedSearchConversation.fromMap(Map<String, dynamic> data) => NestedSearchConversation(
        id: data['id'],
        num: data['n'],
        totalSize: data['total'],
        flags: data['f'],
        tags: data['t'],
        tagNames: data['tn'],
        messages: (data['m'] is Iterable)
            ? List.from((data['m'] as Iterable).map<MessageHitInfo>((m) => MessageHitInfo.fromMap(m)))
            : [],
        queryInfo: data['info']?[0] is Map ? SearchQueryInfo.fromMap(data['info'][0]) : null,
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (num != null) 'n': num,
        if (totalSize != null) 'total': totalSize,
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (messages.isNotEmpty) 'm': messages.map((m) => m.toMap()).toList(),
        if (queryInfo != null) 'info': [queryInfo!.toMap()],
      };
}

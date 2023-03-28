// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/wildcard_expansion_query_info.dart';
import 'suggested_query_string.dart';

class SearchQueryInfo {
  /// Suggest query info
  final List<SuggestedQueryString> suggests;

  /// Wildcard query info
  final List<WildcardExpansionQueryInfo> wildcards;

  const SearchQueryInfo({this.suggests = const [], this.wildcards = const []});

  factory SearchQueryInfo.fromMap(
    Map<String, dynamic> data,
  ) =>
      SearchQueryInfo(
        suggests: (data['suggest'] is Iterable)
            ? (data['suggest'] as Iterable)
                .map<SuggestedQueryString>(
                  (suggest) => SuggestedQueryString.fromMap(suggest),
                )
                .toList(growable: false)
            : const [],
        wildcards: (data['wildcard'] is Iterable)
            ? (data['wildcard'] as Iterable)
                .map<WildcardExpansionQueryInfo>(
                  (wildcard) => WildcardExpansionQueryInfo.fromMap(wildcard),
                )
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        if (suggests.isNotEmpty)
          'suggest': suggests
              .map(
                (suggest) => suggest.toMap(),
              )
              .toList(growable: false),
        if (wildcards.isNotEmpty)
          'wildcard': wildcards
              .map(
                (wildcard) => wildcard.toMap(),
              )
              .toList(growable: false),
      };
}

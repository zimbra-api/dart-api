// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/wildcard_expansion_query_info.dart';

import 'suggested_query_string.dart';

class SearchQueryInfo {
  /// Suggest query info
  final List<SuggestedQueryString> suggests;

  /// Wildcard query info
  final List<WildcardExpansionQueryInfo> wildcards;

  SearchQueryInfo({this.suggests = const [], this.wildcards = const []});

  factory SearchQueryInfo.fromJson(Map<String, dynamic> json) => SearchQueryInfo(
      suggests: (json['suggest'] is Iterable)
          ? List.from((json['suggest'] as Iterable)
              .map<SuggestedQueryString>((suggest) => SuggestedQueryString.fromJson(suggest)))
          : [],
      wildcards: (json['wildcard'] is Iterable)
          ? List.from((json['wildcard'] as Iterable)
              .map<WildcardExpansionQueryInfo>((wildcard) => WildcardExpansionQueryInfo.fromJson(wildcard)))
          : []);

  Map<String, dynamic> toJson() => {
        if (suggests.isNotEmpty) 'suggest': suggests.map((suggest) => suggest.toJson()).toList(),
        if (wildcards.isNotEmpty) 'wildcard': wildcards.map((wildcard) => wildcard.toJson()).toList(),
      };
}

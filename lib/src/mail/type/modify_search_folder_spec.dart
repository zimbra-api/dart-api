// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/search_sort_by.dart';

/// Input for modifying an existing search folder
class ModifySearchFolderSpec {
  /// Search folder id to be edited
  final String id;

  /// Search query
  final String query;

  /// Type for the search folder. Vadlid values is ItemType enum's values
  final String? searchTypes;

  /// Sort order for
  final SearchSortBy? sortBy;

  ModifySearchFolderSpec({this.id = '', this.query = '', this.searchTypes, this.sortBy});

  factory ModifySearchFolderSpec.fromJson(Map<String, dynamic> json) => ModifySearchFolderSpec(
      id: json['id'] ?? '',
      query: json['query'] ?? '',
      searchTypes: json['types'],
      sortBy: SearchSortBy.values.firstWhere(
        (sortBy) => sortBy.name == json['sortBy'],
        orElse: () => SearchSortBy.none,
      ));

  Map<String, dynamic> toJson() => {
        'id': id,
        'query': query,
        if (searchTypes != null) 'types': searchTypes,
        if (sortBy != null) 'sortBy': sortBy!.name,
      };
}
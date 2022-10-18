// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/search_sort_by.dart';

/// Input for creating a new search folder
class NewSearchFolderSpec {
  /// Name
  final String name;

  /// Query string
  final String query;

  /// Search types. Vadlid values is ItemType enum's values
  final String? searchTypes;

  /// Sort by
  final SearchSortBy? sortBy;

  /// Flags
  final String? flags;

  /// Color numeric; range 0-127; defaults to 0 if not present; client can display only 0-7
  final int? color;

  /// RGB color in format #rrggbb where r,g and b are hex digits
  final String? rgb;

  /// Parent folder ID
  final String? parentFolderId;

  NewSearchFolderSpec(
    this.name,
    this.query, {
    this.searchTypes,
    this.sortBy,
    this.flags,
    this.color,
    this.rgb,
    this.parentFolderId,
  });

  factory NewSearchFolderSpec.fromJson(Map<String, dynamic> json) =>
      NewSearchFolderSpec(json['name'] ?? '', json['query'] ?? '',
          searchTypes: json['types'],
          sortBy: SearchSortBy.values.firstWhere(
            (sortBy) => sortBy.name == json['sortBy'],
            orElse: () => SearchSortBy.none,
          ),
          flags: json['f'],
          color: json['color'],
          rgb: json['rgb'],
          parentFolderId: json['l']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'query': query,
        if (searchTypes != null) 'types': searchTypes,
        if (sortBy != null) 'sortBy': sortBy!.name,
        if (flags != null) 'f': flags,
        if (color != null) 'color': color,
        if (rgb != null) 'rgb': rgb,
        if (parentFolderId != null) 'l': parentFolderId,
      };
}

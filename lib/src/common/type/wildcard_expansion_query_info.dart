// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class WildcardExpansionQueryInfo {
  /// Wildcard expansion string
  final String wildcardString;

  /// If value is 1 (true), then the wildcard was expanded and the matches are included in the search.
  /// If value is <b>0 (false)</b> then the wildcard was not specific enough and
  /// therefore no wildcard matches are included (exact-match *is* included in results).
  final bool? expanded;

  /// Number expanded
  final int? numExpanded;

  const WildcardExpansionQueryInfo(
    this.wildcardString, {
    this.expanded,
    this.numExpanded,
  });

  factory WildcardExpansionQueryInfo.fromMap(Map<String, dynamic> data) => WildcardExpansionQueryInfo(data['str'] ?? '',
      expanded: data['expanded'], numExpanded: int.tryParse(data['numExpanded']?.toString() ?? ''));

  Map<String, dynamic> toMap() => {
        'str': wildcardString,
        if (expanded != null) 'expanded': expanded,
        if (numExpanded != null) 'numExpanded': numExpanded,
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/comparison_comparator.dart';
import 'package:zimbra_api/src/common/enum/match_type.dart';
import 'package:zimbra_api/src/common/enum/relational_comparator.dart';

class EditheaderTest {
  /// matchType - is|contains|matches|count|value
  final MatchType? matchType;

  /// if true count comparison will be done
  final bool? countComparator;

  /// if true count comparison will be done
  final bool? valueComparator;

  /// Relational comparator - gt|ge|lt|le|eq|ne
  final RelationalComparator? relationalComparator;

  /// Comparator - i;ascii-numeric|i;ascii-casemap|i;octet
  final ComparisonComparator? comparator;

  /// Name of the header to be compared
  final String? headerName;

  /// Value of the header to be compared
  final List<String> headerValue;

  const EditheaderTest({
    this.matchType,
    this.countComparator,
    this.valueComparator,
    this.relationalComparator,
    this.comparator,
    this.headerName,
    this.headerValue = const [],
  });

  factory EditheaderTest.fromMap(Map<String, dynamic> data) => EditheaderTest(
        matchType: MatchType.values.firstWhere(
          (matchType) => matchType.name == data['matchType'],
          orElse: () => MatchType.value,
        ),
        countComparator: data['countComparator'],
        valueComparator: data['valueComparator'],
        relationalComparator: RelationalComparator.values.firstWhere(
          (comparator) => comparator.name == data['relationalComparator'],
          orElse: () => RelationalComparator.equal,
        ),
        comparator: ComparisonComparator.values.firstWhere(
          (comparator) => comparator.name == data['comparator'],
          orElse: () => ComparisonComparator.asciiNumeric,
        ),
        headerName: data['headerName']?['_content'],
        headerValue: (data['headerValue'] is Iterable)
            ? (data['headerValue'] as Iterable).map<String>((value) => value['_content']).toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        if (matchType != null) 'matchType': matchType!.name,
        if (countComparator != null) 'countComparator': countComparator,
        if (valueComparator != null) 'valueComparator': valueComparator,
        if (relationalComparator != null) 'relationalComparator': relationalComparator!.name,
        if (comparator != null) 'comparator': comparator!.name,
        if (headerName != null) 'headerName': {'_content': headerName},
        if (headerValue.isNotEmpty)
          'headerValue': headerValue.map((headerValue) => {'_content': headerValue}).toList(growable: false),
      };
}

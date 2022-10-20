// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/filter_flag_name.dart';

import 'filter_test.dart';

class FlaggedTest extends FilterTest {
  /// Flag name - flagged|read|priority
  final FilterFlagName? flag;

  FlaggedTest({this.flag, super.index, super.negative});

  factory FlaggedTest.fromJson(Map<String, dynamic> json) => FlaggedTest(
      flag: FilterFlagName.values.firstWhere(
        (flagName) => flagName.name == json['flagName'],
        orElse: () => FilterFlagName.flagged,
      ),
      index: json['index'],
      negative: json['negative']);

  @override
  Map<String, dynamic> toJson() => {
        if (flag != null) 'flagName': flag!.name,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}

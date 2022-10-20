// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/filter_flag_name.dart';

import 'filter_action.dart';

class FlagAction extends FilterAction {
  /// Flag name - flagged|read|priority
  final FilterFlagName? flag;

  FlagAction({this.flag, super.index});

  factory FlagAction.fromJson(Map<String, dynamic> json) => FlagAction(
      flag: FilterFlagName.values.firstWhere(
        (flagName) => flagName.name == json['flagName'],
        orElse: () => FilterFlagName.flagged,
      ),
      index: json['index']);

  @override
  Map<String, dynamic> toJson() => {
        if (flag != null) 'flagName': flag!.name,
        if (index != null) 'index': index,
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/filter_flag_name.dart';
import 'filter_action.dart';

class FlagAction extends FilterAction {
  /// Flag name - flagged|read|priority
  final FilterFlagName? flag;

  const FlagAction({this.flag, super.index});

  factory FlagAction.fromMap(Map<String, dynamic> data) => FlagAction(
      flag: FilterFlagName.values.firstWhere(
        (flagName) => flagName.name == data['flagName'],
        orElse: () => FilterFlagName.flagged,
      ),
      index: int.tryParse(data['index']?.toString() ?? ''));

  @override
  Map<String, dynamic> toMap() => {
        if (flag != null) 'flagName': flag!.name,
        if (index != null) 'index': index,
      };
}

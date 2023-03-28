// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'date_attr.dart';

class AlarmTriggerInfo {
  /// Absolute trigger information
  final DateAttr? absolute;

  /// Relative trigger information
  final DateAttr? relative;

  const AlarmTriggerInfo({this.absolute, this.relative});

  factory AlarmTriggerInfo.fromMap(
    Map<String, dynamic> data,
  ) =>
      AlarmTriggerInfo(
        absolute: data['abs'] is Map ? DateAttr.fromMap(data['abs']) : null,
        relative: data['rel'] is Map ? DateAttr.fromMap(data['rel']) : null,
      );

  Map<String, dynamic> toMap() => {
        if (absolute != null) 'abs': absolute!.toMap(),
        if (relative != null) 'rel': relative!.toMap(),
      };
}

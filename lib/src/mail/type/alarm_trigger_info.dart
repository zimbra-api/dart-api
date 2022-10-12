// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'date_attr.dart';

class AlarmTriggerInfo {
  /// Absolute trigger information
  final DateAttr? absolute;

  /// Relative trigger information
  final DateAttr? relative;

  AlarmTriggerInfo({this.absolute, this.relative});

  factory AlarmTriggerInfo.fromJson(Map<String, dynamic> json) => AlarmTriggerInfo(
      absolute: json['abs'] is Map ? DateAttr.fromJson(json['abs']) : null,
      relative: json['rel'] is Map ? DateAttr.fromJson(json['rel']) : null);

  Map<String, dynamic> toJson() => {
        if (absolute != null) 'abs': absolute!.toJson(),
        if (relative != null) 'rel': relative!.toJson(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'dt_time_info.dart';
import 'duration_info.dart';

/// Date/time value
class DtVal {
  /// Start DATE-TIME
  final DtTimeInfo? startTime;

  /// Start DATE-TIME
  final DtTimeInfo? endTime;

  /// Duration information
  final DurationInfo? duration;

  DtVal({this.startTime, this.endTime, this.duration});

  factory DtVal.fromJson(Map<String, dynamic> json) => DtVal(
      startTime: json['s'] is Map ? DtTimeInfo.fromJson(json['s']) : null,
      endTime: json['e'] is Map ? DtTimeInfo.fromJson(json['e']) : null,
      duration: json['dur'] is Map ? DurationInfo.fromJson(json['dur']) : null);

  Map<String, dynamic> toJson() => {
        if (startTime != null) 's': startTime!.toJson(),
        if (endTime != null) 'e': endTime!.toJson(),
        if (duration != null) 'dur': duration!.toJson(),
      };
}

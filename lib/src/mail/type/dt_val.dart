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

  factory DtVal.fromMap(Map<String, dynamic> data) => DtVal(
      startTime: data['s'] is Map ? DtTimeInfo.fromMap(data['s']) : null,
      endTime: data['e'] is Map ? DtTimeInfo.fromMap(data['e']) : null,
      duration: data['dur'] is Map ? DurationInfo.fromMap(data['dur']) : null);

  Map<String, dynamic> toMap() => {
        if (startTime != null) 's': startTime!.toMap(),
        if (endTime != null) 'e': endTime!.toMap(),
        if (duration != null) 'dur': duration!.toMap(),
      };
}

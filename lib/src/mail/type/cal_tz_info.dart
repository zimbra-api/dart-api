// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/tz_onset_info.dart';

/// Timezone specification
class CalTZInfo {
  /// Timezone ID.
  /// If this is the only detail present then this should be an existing server-known timezone's ID
  /// Otherwise, it must be present, although it will be ignored by the server
  final String id;

  /// Standard Time's offset in minutes from UTC; local = UTC + offset
  final int tzStdOffset;

  /// Daylight Saving Time's offset in minutes from UTC; present only if DST is used
  final int tzDayOffset;

  /// Time/rule for transitioning from daylight time to standard time.
  /// Either specify week/wkday combo, or mday.
  final TzOnsetInfo? standardTzOnset;

  /// Time/rule for transitioning from standard time to daylight time
  final TzOnsetInfo? daylightTzOnset;

  /// Standard Time component's timezone name
  final String? standardTZName;

  /// Daylight Saving Time component's timezone name
  final String? daylightTZName;

  CalTZInfo(this.id, this.tzStdOffset, this.tzDayOffset,
      {this.standardTzOnset, this.daylightTzOnset, this.standardTZName, this.daylightTZName});

  factory CalTZInfo.fromJson(Map<String, dynamic> json) =>
      CalTZInfo(json['id'] ?? '', json['stdoff'] ?? 0, json['dayoff'] ?? 0,
          standardTzOnset: json['standard'] != null ? TzOnsetInfo.fromJson(json['standard']) : null,
          daylightTzOnset: json['daylight'] != null ? TzOnsetInfo.fromJson(json['daylight']) : null,
          standardTZName: json['stdname'],
          daylightTZName: json['dayname']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'stdoff': tzStdOffset,
        'dayoff': tzDayOffset,
        if (standardTzOnset != null) 'standard': standardTzOnset!.toJson(),
        if (daylightTzOnset != null) 'daylight': daylightTzOnset!.toJson(),
        if (standardTZName != null) 'stdname': standardTZName,
        if (daylightTZName != null) 'dayname': daylightTZName,
      };
}

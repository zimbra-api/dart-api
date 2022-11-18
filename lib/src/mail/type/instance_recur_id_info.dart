// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/recurrence_range.dart';

/// Instance recurrence ID information
class InstanceRecurIdInfo {
  /// Range - THISANDFUTURE|THISANDPRIOR
  final RecurrenceRange? range;

  /// Date and/or time.  Format is : YYYYMMDD['T'HHMMSS[Z]]
  /// where:
  ///     YYYY - 4 digit year
  ///     MM   - 2 digit month
  ///     DD   - 2 digit day
  /// Optionally:
  ///     'T' the literal char "T" then
  ///     HH - 2 digit hour (00-23)
  ///     MM - 2 digit minute (00-59)
  ///     SS - 2 digit second (00-59)
  ///     ...and finally an optional "Z" meaning that the time is UTC,
  ///     otherwise the tz="TIMEZONE" param MUST be specified with the DATETIME
  ///     e.g:
  ///         20050612  June 12, 2005
  ///         20050315T18302305Z  March 15, 2005 6:30:23.05 PM UTC
  final String? dateTime;

  /// Java timezone identifier
  final String? timezone;

  const InstanceRecurIdInfo({this.range, this.dateTime, this.timezone});

  factory InstanceRecurIdInfo.fromMap(Map<String, dynamic> data) => InstanceRecurIdInfo(
      range: RecurrenceRange.values.firstWhere(
        (item) => item.name == data['by'],
        orElse: () => RecurrenceRange.thisAndFuture,
      ),
      dateTime: data['d'],
      timezone: data['tz']);

  Map<String, dynamic> toMap() => {
        if (range != null) 'range': range!.name,
        if (dateTime != null) 'd': dateTime,
        if (timezone != null) 'tz': timezone,
      };
}

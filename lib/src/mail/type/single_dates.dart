// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'dt_val.dart';

/// Single dates information
class SingleDates {
  /// TZID
  final String? timezone;

  /// Information on start date/time and end date/time or duration
  final List<DtVal> dtVals;

  const SingleDates({this.timezone, this.dtVals = const []});

  factory SingleDates.fromMap(Map<String, dynamic> data) => SingleDates(
        timezone: data['tz'],
        dtVals: (data['dtval'] is Iterable)
            ? (data['dtval'] as Iterable)
                .map<DtVal>(
                  (dtval) => DtVal.fromMap(dtval),
                )
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        if (timezone != null) 'tz': timezone,
        if (dtVals.isNotEmpty)
          'dtval': dtVals
              .map(
                (dtval) => dtval.toMap(),
              )
              .toList(growable: false),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/mail/type/dt_val.dart';

/// Single dates information
class SingleDates {
  /// TZID
  final String? timezone;

  /// Information on start date/time and end date/time or duration
  final List<DtVal> dtVals;

  SingleDates({this.timezone, this.dtVals = const []});

  factory SingleDates.fromJson(Map<String, dynamic> json) => SingleDates(
      timezone: json['tz'],
      dtVals: (json['dtval'] is Iterable)
          ? List.from((json['dtval'] as Iterable).map<DtVal>((dtval) => DtVal.fromJson(dtval)))
          : []);

  Map<String, dynamic> toJson() => {
        if (timezone != null) 'tz': timezone,
        if (dtVals.isNotEmpty) 'dtval': dtVals.map((dtval) => dtval.toJson()).toList(),
      };
}

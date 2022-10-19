// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/mail/type/legacy_calendaring_data.dart';

import 'get_appt_summaries_response.dart';

class GetCalendarItemSummariesResponse extends GetApptSummariesResponse {
  GetCalendarItemSummariesResponse({super.apptEntries = const [], super.taskEntries = const []});

  factory GetCalendarItemSummariesResponse.fromJson(Map<String, dynamic> json) => GetCalendarItemSummariesResponse(
      apptEntries: (json['appt'] is Iterable)
          ? List.from(
              (json['appt'] as Iterable).map<LegacyCalendaringData>((appt) => LegacyCalendaringData.fromJson(appt)))
          : [],
      taskEntries: (json['task'] is Iterable)
          ? List.from(
              (json['task'] as Iterable).map<LegacyCalendaringData>((task) => LegacyCalendaringData.fromJson(task)))
          : []);
}

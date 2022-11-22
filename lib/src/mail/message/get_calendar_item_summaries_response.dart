// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../type/legacy_calendaring_data.dart';
import 'get_appt_summaries_response.dart';

class GetCalendarItemSummariesResponse extends GetApptSummariesResponse {
  GetCalendarItemSummariesResponse({super.apptEntries = const [], super.taskEntries = const []});

  factory GetCalendarItemSummariesResponse.fromMap(Map<String, dynamic> data) => GetCalendarItemSummariesResponse(
      apptEntries: (data['appt'] is Iterable)
          ? (data['appt'] as Iterable)
              .map<LegacyCalendaringData>((appt) => LegacyCalendaringData.fromMap(appt))
              .toList(growable: false)
          : const [],
      taskEntries: (data['task'] is Iterable)
          ? (data['task'] as Iterable)
              .map<LegacyCalendaringData>((task) => LegacyCalendaringData.fromMap(task))
              .toList(growable: false)
          : const []);
}

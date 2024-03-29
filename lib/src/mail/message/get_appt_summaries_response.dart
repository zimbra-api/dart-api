// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/legacy_calendaring_data.dart';

class GetApptSummariesResponse extends SoapResponse {
  /// Appointment summaries
  final List<LegacyCalendaringData> apptEntries;

  /// Task summaries
  final List<LegacyCalendaringData> taskEntries;

  GetApptSummariesResponse({
    this.apptEntries = const [],
    this.taskEntries = const [],
  });

  factory GetApptSummariesResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetApptSummariesResponse(
        apptEntries: (data['appt'] is Iterable)
            ? (data['appt'] as Iterable)
                .map<LegacyCalendaringData>(
                  (appt) => LegacyCalendaringData.fromMap(appt),
                )
                .toList(growable: false)
            : const [],
        taskEntries: (data['task'] is Iterable)
            ? (data['task'] as Iterable)
                .map<LegacyCalendaringData>(
                  (task) => LegacyCalendaringData.fromMap(task),
                )
                .toList(growable: false)
            : const [],
      );
}

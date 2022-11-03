// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_calendar_item_summaries_request.dart';
import 'get_calendar_item_summaries_response.dart';

class GetCalendarItemSummariesBody extends SoapBody {
  GetCalendarItemSummariesBody(
      {GetCalendarItemSummariesRequest? request, GetCalendarItemSummariesResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetCalendarItemSummariesBody.fromMap(Map<String, dynamic> data) => GetCalendarItemSummariesBody(
      response: data['GetCalendarItemSummariesResponse'] != null
          ? GetCalendarItemSummariesResponse.fromMap(data['GetCalendarItemSummariesResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetCalendarItemSummariesRequest': request!.toMap(),
      };
}

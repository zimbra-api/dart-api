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

  factory GetCalendarItemSummariesBody.fromJson(Map<String, dynamic> json) => GetCalendarItemSummariesBody(
      response: json['GetCalendarItemSummariesResponse'] != null
          ? GetCalendarItemSummariesResponse.fromJson(json['GetCalendarItemSummariesResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetCalendarItemSummariesRequest? get getCalendarItemSummariesRequest => request as GetCalendarItemSummariesRequest?;

  GetCalendarItemSummariesResponse? get getCalendarItemSummariesResponse =>
      response as GetCalendarItemSummariesResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetCalendarItemSummariesRequest': request!.toJson(),
      };
}

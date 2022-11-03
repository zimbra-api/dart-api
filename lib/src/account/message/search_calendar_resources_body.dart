// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'search_calendar_resources_request.dart';
import 'search_calendar_resources_response.dart';

class SearchCalendarResourcesBody extends SoapBody {
  SearchCalendarResourcesBody(
      {SearchCalendarResourcesRequest? request, SearchCalendarResourcesResponse? response, super.fault})
      : super(request: request, response: response);

  factory SearchCalendarResourcesBody.fromMap(Map<String, dynamic> data) => SearchCalendarResourcesBody(
      response: data['SearchCalendarResourcesResponse'] != null
          ? SearchCalendarResourcesResponse.fromMap(data['SearchCalendarResourcesResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  SearchCalendarResourcesRequest? get searchCalendarResourcesRequest => request as SearchCalendarResourcesRequest?;

  SearchCalendarResourcesResponse? get searchCalendarResourcesResponse => response as SearchCalendarResourcesResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SearchCalendarResourcesRequest': request!.toMap(),
      };
}

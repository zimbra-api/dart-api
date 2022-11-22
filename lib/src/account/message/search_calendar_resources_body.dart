// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'search_calendar_resources_request.dart';
import 'search_calendar_resources_response.dart';

class SearchCalendarResourcesBody extends SoapBody {
  SearchCalendarResourcesBody(
      {SearchCalendarResourcesRequest? request, SearchCalendarResourcesResponse? response})
      : super(request: request, response: response);

  factory SearchCalendarResourcesBody.fromMap(Map<String, dynamic> data) => SearchCalendarResourcesBody(
      response: data['SearchCalendarResourcesResponse'] != null
          ? SearchCalendarResourcesResponse.fromMap(data['SearchCalendarResourcesResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SearchCalendarResourcesRequest': request!.toMap(),
      };
}

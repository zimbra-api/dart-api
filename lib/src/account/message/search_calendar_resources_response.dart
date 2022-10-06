// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/calendar_resource_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class SearchCalendarResourcesResponse extends SoapResponse {
  /// Name of attribute sorted on. If not present then sorted by the calendar resource name.
  final String? sortBy;

  /// The 0-based offset into the results list to return as the first result for this search operation.
  final int? offset;

  /// Flags whether there are more results
  final bool? more;

  /// Flag whether the underlying search supported pagination.
  /// true - limit and offset in the request was honored
  /// false - the underlying search does not support pagination. limit and offset in the request was not honored
  final bool? pagingSupported;

  /// Matching calendar resources
  final List<CalendarResourceInfo> calendarResources;

  SearchCalendarResourcesResponse(
      {this.sortBy,
      this.offset,
      this.more,
      this.pagingSupported,
      this.calendarResources = const <CalendarResourceInfo>[]});

  factory SearchCalendarResourcesResponse.fromJson(Map<String, dynamic> json) {
    final response = SearchCalendarResourcesResponse(
        sortBy: json['sortBy'],
        offset: json['offset'],
        more: json['more'],
        pagingSupported: json['paginationSupported']);

    if (json['calresource'] != null && json['calresource'] is Iterable) {
      final calendarResources = json['calresource'] as Iterable;
      for (final calresource in calendarResources) {
        response.calendarResources.add(CalendarResourceInfo.fromJson(calresource));
      }
    }

    return response;
  }
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/calendar_resource_info.dart';

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

  SearchCalendarResourcesResponse({
    this.sortBy,
    this.offset,
    this.more,
    this.pagingSupported,
    this.calendarResources = const [],
  });

  factory SearchCalendarResourcesResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      SearchCalendarResourcesResponse(
        sortBy: data['sortBy'],
        offset: int.tryParse(data['offset']?.toString() ?? ''),
        more: data['more'],
        pagingSupported: data['paginationSupported'],
        calendarResources: (data['calresource'] is Iterable)
            ? (data['calresource'] as Iterable)
                .map<CalendarResourceInfo>(
                  (resource) => CalendarResourceInfo.fromMap(resource),
                )
                .toList(growable: false)
            : const [],
      );
}

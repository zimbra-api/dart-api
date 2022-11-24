// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/cursor_info.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import '../type/entry_search_filter_info.dart';
import 'search_calendar_resources_body.dart';
import 'search_calendar_resources_envelope.dart';

/// Search Global Address List (GAL) for calendar resources
/// "attrs" attribute - comma-separated list of attrs to return ("displayName", "zimbraId", "zimbraCalResType")
class SearchCalendarResourcesRequest extends SoapRequest {
  /// Cursor specification
  final CursorInfo? cursor;

  /// Search Filter
  final EntrySearchFilterInfo? searchFilter;

  /// "Quick" flag.
  /// For performance reasons, the index system accumulates messages with not-indexed-yet state until a certain
  /// threshold and indexes them as a batch. To return up-to-date search results, the index system also indexes those
  /// pending messages right before a search. To lower latencies, this option gives a hint to the index system not to
  /// trigger this catch-up index prior to the search by giving up the freshness of the search results, i.e. recent
  /// messages may not be included in the search results.
  final bool? quick;

  /// Name of attribute to sort on. default is the calendar resource name.
  final String? sortBy;

  /// The maximum number of calendar resources to return (0 is default and means all)
  final int? limit;

  /// The starting offset (0, 25, etc)
  final int? offset;

  /// Client locale identification.
  final String? locale;

  /// GAL Account ID
  final String? galAccountId;

  /// If specified, passed through to the GAL search as the search key
  final String? name;

  /// attribute - comma-separated list of attrs to return ("displayName", "zimbraId", "zimbraCalResType")
  final String? attrs;

  SearchCalendarResourcesRequest({
    this.cursor,
    this.searchFilter,
    this.quick,
    this.sortBy,
    this.limit,
    this.offset,
    this.locale,
    this.galAccountId,
    this.name,
    this.attrs,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      SearchCalendarResourcesEnvelope(SearchCalendarResourcesBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        if (quick != null) 'quick': quick,
        if (sortBy != null) 'sortBy': sortBy,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
        if (locale != null) 'locale': {'_content': locale},
        if (cursor != null) 'cursor': cursor!.toMap(),
        if (galAccountId != null) 'galAcctId': galAccountId,
        if (name != null) 'name': {'_content': name},
        if (searchFilter != null) 'searchFilter': searchFilter!.toMap(),
        if (attrs != null) 'attrs': attrs,
      };
}

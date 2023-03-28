// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/gal_search_type.dart';
import '../../common/enum/member_of_selector.dart';
import '../../common/type/cursor_info.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import '../type/entry_search_filter_info.dart';
import 'search_gal_body.dart';
import 'search_gal_envelope.dart';

/// Search Global Address List (GAL)
class SearchGalRequest extends SoapRequest {
  /// Cursor specification
  final CursorInfo? cursor;

  /// Search filter specification
  final EntrySearchFilterInfo? searchFilter;

  /// If set then search GAL by this ref, which is a dn.
  /// If specified then "name" attribute is ignored.
  final String? ref;

  /// Query string.
  /// Note: ignored if <ref> is specified
  final String? name;

  /// type of addresses to auto-complete on.
  /// - "account" for regular user accounts, aliases and distribution lists
  /// - "resource" for calendar resources
  /// - "group" for groups
  /// - "all" for combination of all types
  /// if omitted, defaults to "all"
  final GalSearchType? type;

  /// flag whether the <exp> flag is needed in the response for group entries.
  /// Default is unset.
  final bool? needCanExpand;

  /// Set this if the "isOwner" flag is needed in the response for group entries.
  /// Default is unset.
  final bool? needIsOwner;

  /// Specify if the "isMember" flag is needed in the response for group entries.
  /// - all: the isMember flag returned is set if the user is a direct or indirect member ofthe group, otherwise it is unset
  /// - directOnly: the isMember flag returned is set if the user is a direct member of the group, otherwise it is unset
  /// - none (default): The isMember flag is not returned
  final MemberOfSelector? needIsMember;

  /// Internal attr, for proxied GSA search from GetSMIMEPublicCerts only
  final bool? needSMIMECerts;

  /// GAL Account ID
  final String? galAccountId;

  /// "Quick" flag.
  /// For performance reasons, the index system accumulates messages with not-indexed-yet state until a certain
  /// threshold and indexes them as a batch. To return up-to-date search results, the index system also indexes those
  /// pending messages right before a search. To lower latencies, this option gives a hint to the index system not to
  /// trigger this catch-up index prior to the search by giving up the freshness of the search results, i.e. recent
  /// messages may not be included in the search results
  final bool? quick;

  /// Name of attribute to sort on. default is the calendar resource name.
  final String? sortBy;

  /// The maximum number of calendar resources to return (0 is default and means all)
  final int? limit;

  /// The starting offset (0, 25, etc)
  final int? offset;

  /// Client locale identification.
  final String? locale;

  SearchGalRequest({
    this.cursor,
    this.searchFilter,
    this.ref,
    this.name,
    this.type,
    this.needCanExpand,
    this.needIsOwner,
    this.needIsMember,
    this.needSMIMECerts,
    this.galAccountId,
    this.quick,
    this.sortBy,
    this.limit,
    this.offset,
    this.locale,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => SearchGalEnvelope(
        SearchGalBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        if (ref != null) 'ref': ref,
        if (name != null) 'name': name,
        if (type != null) 'type': type!.name,
        if (needCanExpand != null) 'needExp': needCanExpand,
        if (needIsOwner != null) 'needIsOwner': needIsOwner,
        if (needIsMember != null) 'needIsMember': needIsMember!.name,
        if (needSMIMECerts != null) 'needSMIMECerts': needSMIMECerts,
        if (galAccountId != null) 'galAcctId': galAccountId,
        if (quick != null) 'quick': quick,
        if (sortBy != null) 'sortBy': sortBy,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
        if (locale != null) 'locale': {'_content': locale},
        if (cursor != null) 'cursor': cursor!.toMap(),
        if (searchFilter != null) 'searchFilter': searchFilter!.toMap(),
      };
}

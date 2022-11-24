// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../type/mail_search_params.dart';
import 'search_body.dart';
import 'search_envelope.dart';

/// Search
/// For a response, the order of the returned results represents the sorted order.
/// There is not a separate index attribute or element.
class SearchRequest extends MailSearchParams {
  /// Warmup: When this option is specified, all other options are simply ignored,
  /// so you can't include this option in regular search requests.
  /// This option gives a hint to the index system to open the index data and primes it for search.
  /// The client should send this warm-up request as soon as the user puts the cursor on the search bar.
  /// This will not only prime the index but also opens a persistent HTTP connection
  /// (HTTP 1.1 Keep-Alive) to the server, hence smaller latencies in subseqent search requests.
  /// Sending this warm-up request too early (e.g. login time) will be in vain in most cases because
  /// the index data is evicted from the cache due to inactivity timeout by the time you actually send a search request.
  final bool? warmup;

  SearchRequest({
    this.warmup,
    super.includeTagDeleted,
    super.includeTagMuted,
    super.allowableTaskStatus,
    super.calItemExpandStart,
    super.calItemExpandEnd,
    super.query,
    super.inDumpster,
    super.searchTypes,
    super.groupBy,
    super.quick,
    super.sortBy,
    super.fetch,
    super.markRead,
    super.maxInlinedLength,
    super.wantHtml,
    super.needCanExpand,
    super.neuterImages,
    super.wantRecipients,
    super.prefetch,
    super.resultMode,
    super.fullConversation,
    super.field,
    super.limit,
    super.offset,
    super.headers = const [],
    super.timezone,
    super.locale,
    super.cursor,
    super.wantContent,
    super.includeMemberOf,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => SearchEnvelope(SearchBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (warmup != null) 'warmup': warmup,
        if (includeTagDeleted != null) 'includeTagDeleted': includeTagDeleted,
        if (includeTagMuted != null) 'includeTagMuted': includeTagMuted,
        if (allowableTaskStatus != null) 'allowableTaskStatus': allowableTaskStatus,
        if (calItemExpandStart != null) 'calExpandInstStart': calItemExpandStart,
        if (calItemExpandEnd != null) 'calExpandInstEnd': calItemExpandEnd,
        if (query != null) 'query': query,
        if (inDumpster != null) 'inDumpster': inDumpster,
        if (searchTypes != null) 'types': searchTypes,
        if (groupBy != null) 'groupBy': groupBy,
        if (quick != null) 'quick': quick,
        if (sortBy != null) 'sortBy': sortBy!.name,
        if (fetch != null) 'fetch': fetch,
        if (markRead != null) 'read': markRead,
        if (maxInlinedLength != null) 'max': maxInlinedLength,
        if (wantHtml != null) 'html': wantHtml,
        if (needCanExpand != null) 'needExp': needCanExpand,
        if (neuterImages != null) 'neuter': neuterImages,
        if (wantRecipients != null) 'recip': wantRecipients!.name,
        if (prefetch != null) 'prefetch': prefetch,
        if (resultMode != null) 'resultMode': resultMode!.name,
        if (fullConversation != null) 'fullConversation': fullConversation,
        if (field != null) 'field': field,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toMap()).toList(growable: false),
        if (timezone != null) 'tz': timezone!.toMap(),
        if (locale != null) 'locale': {'_content': locale},
        if (cursor != null) 'cursor': cursor!.toMap(),
        if (wantContent != null) 'wantContent': wantContent!.name,
        if (includeMemberOf != null) 'memberOf': includeMemberOf,
      };
}

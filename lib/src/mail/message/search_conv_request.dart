// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/mail/type/mail_search_params.dart';

import 'search_conv_body.dart';
import 'search_conv_envelope.dart';

/// Search a conversation
class SearchConvRequest extends MailSearchParams {
  /// The ID of the conversation to search within. REQUIRED.
  final String conversationId;

  /// If set then the response will contain a top level <c> element representing
  /// the conversation with child <m> elements representing messages in the conversation.
  /// If unset, no <c> element is included - <m> elements will be top level elements.
  final bool? nestMessages;

  SearchConvRequest(this.conversationId,
      {this.nestMessages,
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
      super.includeMemberOf});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => SearchConvEnvelope(SearchConvBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'cid': conversationId,
        if (nestMessages != null) 'nest': nestMessages,
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
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toMap()).toList(),
        if (timezone != null) 'tz': timezone!.toMap(),
        if (locale != null) 'locale': {'_content': locale},
        if (cursor != null) 'cursor': cursor!.toMap(),
        if (wantContent != null) 'wantContent': wantContent!.name,
        if (includeMemberOf != null) 'memberOf': includeMemberOf,
      };
}

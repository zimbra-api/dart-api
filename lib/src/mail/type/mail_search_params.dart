// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/msg_content.dart';
import 'package:zimbra_api/src/common/enum/result_mode.dart';
import 'package:zimbra_api/src/common/enum/search_sort_by.dart';
import 'package:zimbra_api/src/common/enum/want_recips_setting.dart';
import 'package:zimbra_api/src/common/type/attribute_name.dart';
import 'package:zimbra_api/src/common/type/cursor_info.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'cal_tz_info.dart';

abstract class MailSearchParams extends SoapRequest {
  /// Set to true to include items with the Deleted calItemExpandStart set in results
  final bool? includeTagDeleted;

  /// Set to true to include items with the Muted calItemExpandStart set in results
  final bool? includeTagMuted;

  /// Comma separated list of allowable Task statuses.
  /// Valid values : NEED, INPR, WAITING, DEFERRED, COMP
  final String? allowableTaskStatus;

  /// Start time in milliseconds for the range to include instances for calendar items from.
  final int? calItemExpandStart;

  /// End time in milliseconds for the range to include instances for calendar items from.
  final int? calItemExpandEnd;

  /// Query string
  final String? query;

  /// Set this flat to true to search dumpster data instead of live data.
  final bool? inDumpster;

  /// Comma separated list of search types
  /// Legal values are: conversation|message|contact|appointment|task|wiki|document
  /// Default is "conversation".
  final String? searchTypes;

  /// Deprecated. Use {searchTypes} instead
  final String? groupBy;

  /// "Quick" flag.
  /// For performance reasons, the index system accumulates messages with not-indexed-yet state until a certain
  /// threshold and indexes them as a batch. To return up-to-date search results, the index system also indexes those
  /// pending messages right before a search. To lower latencies, this option gives a hint to the index system not to
  /// cursor this catch-up index prior to the search by giving up the freshness of the search results, i.e. recent
  /// messages may not be included in the search results.
  final bool? quick;

  /// SortBy setting.
  /// Default value is "dateDesc"
  /// Possible values:
  /// none|dateAsc|dateDesc|subjAsc|subjDesc|nameAsc|nameDesc|rcptAsc|rcptDesc|calTzAsc|calTzDesc|flagAsc|flagDesc|priorityAsc|priorityDesc|idAsc|idDesc|readAsc|readDesc
  final SearchSortBy? sortBy;

  /// Select setting for hit expansion.
  /// if fetch="1" (or fetch="first") is specified, the first hit will be expanded inline (messages only at present)
  /// if fetch="{item-id}", only the message with the given {item-id} is expanded inline
  /// if fetch="{item-id-1,item-id-2,...,item-id-n}", messages with ids in the comma-separated list will be expanded
  /// if fetch="all", all messages are expanded inline
  /// if fetch="!", only the first message in the conversation will be expanded, whether it's a hit or not
  /// if fetch="u" (or fetch="unread"), all unread hits are expanded
  /// if fetch="u1" (or fetch="unread-first"), if there are any unread hits, they are expanded, otherwise the first hit is expanded.
  /// if fetch="u1!", if there are any unread hits, they are expanded, otherwise the first hit and the first message are expanded (those may be the same)
  /// if fetch="hits", all hits are expanded
  /// if fetch="hits!", all hits are expanded if there are any, otherwise the first message is expanded
  final String? fetch;

  /// Inlined hits will be marked as read
  final bool? markRead;

  /// If specified, inlined body content in limited to the given length;
  /// if the part is truncated, truncated="1" is specified on the <mp> in question
  final int? maxInlinedLength;

  /// Set to true to cause inlined hits to return HTML parts if available
  final bool? wantHtml;

  /// If 'needExp' is set in the request, two additional flags may be included in <e> elements for messages returned inline.
  final bool? needCanExpand;

  /// Set to false to stop images in inlined HTML parts from being "neutered"
  final bool? neuterImages;

  /// Setting specifying which recipients should be returned.
  /// 0 [default]:
  ///    - returned sent messages will contain "From:" Senders only
  ///    - returned conversations will contain an aggregated list of "From:" Senders from messages in the conversation (maximum of 8)
  /// 1:
  ///    - returned sent messages will contain the set of "To:" Recipients instead of the Sender
  ///    - returned conversations whose first hit was sent by the user will contain that hit's "To:" recipients instead of the conversation's sender list (maximum of 8)
  /// 2:
  ///    - returned sent messages will contain the sets of both "From:" Senders and "To:" Recipients
  ///    - returned conversations will contain an aggregated list of "From:" Senders and "To:" Recipients from messages in the conversation (maximum of 8 of each)
  final WantRecipsSetting? wantRecipients;

  /// Prefetch
  final bool? prefetch;

  /// Specifies the type of result.
  /// NORMAL [default]: Everything
  /// IDS: Only IDs
  final ResultMode? resultMode;

  /// By default, only matching messages are included in conversation results.
  /// Set to true to include all messages in the conversation, even if they don't match the search,
  ///including items in Trash and Junk folders.
  final bool? fullConversation;

  /// By default, text without an operator searches the CONTENT field.
  /// By setting the {default-field} value, you can control the default operator.
  /// Specify any of the text operators that are  available in query.txt,
  /// e.g. 'content:' [the default] or 'subject:', etc.
  /// The date operators (date, after, before) and the "item:" operator should not be specified
  /// as default fields because of quirks in the search grammar.
  final String? field;

  /// The maximum number of results to return. It defaults to 10 if not specified, and is capped by 1000
  final int? limit;

  /// Specifies the 0-based offset into the results list to return as the first result for this search operation.
  /// For example, limit=10 offset=30 will return the 31st through 40th results inclusive.
  final int? offset;

  /// if <header>s are requested, any matching headers are included in inlined message hits
  final List<AttributeName> headers;

  /// Timezone specification
  final CalTZInfo? timezone;

  /// Client locale identification.
  /// Value is of the form LL-CC[-V+] where:
  /// LL is two character language code
  /// CC is two character country code
  /// V+ is optional variant identifier string
  /// ISO Language Codes: http://www.ics.uci.edu/pub/ietf/http/related/iso639.txt
  /// ISO Country Codes: http://www.chemie.fu-berlin.de/diverse/doc/ISO_3166.html
  final String? locale;

  /// Cursor specification
  final CursorInfo? cursor;

  /// used by clients if they want mail content with/without quoted text
  final MsgContent? wantContent;

  /// If set, Include the list of contact groups this contact is a member of.
  /// Note: use sparingly, there is a performance penalty associated with computing this information
  final bool? includeMemberOf;

  MailSearchParams(
      {this.includeTagDeleted,
      this.includeTagMuted,
      this.allowableTaskStatus,
      this.calItemExpandStart,
      this.calItemExpandEnd,
      this.query,
      this.inDumpster,
      this.searchTypes,
      this.groupBy,
      this.quick,
      this.sortBy,
      this.fetch,
      this.markRead,
      this.maxInlinedLength,
      this.wantHtml,
      this.needCanExpand,
      this.neuterImages,
      this.wantRecipients,
      this.prefetch,
      this.resultMode,
      this.fullConversation,
      this.field,
      this.limit,
      this.offset,
      this.headers = const [],
      this.timezone,
      this.locale,
      this.cursor,
      this.wantContent,
      this.includeMemberOf});
}

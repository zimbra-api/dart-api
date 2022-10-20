// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/attribute_name.dart';

class ConversationSpec {
  /// Conversation ID
  final String? id;

  /// if value is "1" or "all" the full expanded message structure is inlined for the
  /// first (or for all) messages in the conversation.
  final String? inlineRule;

  /// Set to return defanged HTML content by default. (default is unset)
  final bool? wantHtml;

  /// Maximum inlined length
  final int? maxInlinedLength;

  /// Set to return group info (isGroup and exp flags) on <e> elements in the response (default is unset.)
  final bool? needCanExpand;

  /// Requested headers. if <header>s are requested, any matching headers are
  /// inlined into the response (not available when raw is set)
  final List<AttributeName> headers;

  ConversationSpec(
      {this.id, this.inlineRule, this.wantHtml, this.maxInlinedLength, this.needCanExpand, this.headers = const []});

  factory ConversationSpec.fromJson(Map<String, dynamic> json) => ConversationSpec(
      id: json['id'],
      inlineRule: json['fetch'],
      wantHtml: json['html'],
      maxInlinedLength: json['max'],
      needCanExpand: json['needExp'],
      headers: (json['header'] is Iterable)
          ? List.from((json['header'] as Iterable).map<AttributeName>((header) => AttributeName.fromJson(header)))
          : []);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (inlineRule != null) 'fetch': inlineRule,
        if (wantHtml != null) 'html': wantHtml,
        if (maxInlinedLength != null) 'max': maxInlinedLength,
        if (needCanExpand != null) 'needExp': needCanExpand,
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toJson()).toList(),
      };
}

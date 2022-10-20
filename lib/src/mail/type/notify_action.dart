// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_action.dart';

class NotifyAction extends FilterAction {
  /// Email address
  final String? address;

  /// Subject template
  /// Can contain variables such as ${SUBJECT}, ${TO}, ${CC}, etc
  /// (basically ${any-header-name}; case not important), plus ${BODY} (text body of the message).
  final String? subject;

  /// Maximum body size in bytes
  final int? maxBodySize;

  /// Body template
  /// Can contain variables such as ${SUBJECT}, ${TO}, ${CC}, etc
  /// (basically ${any-header-name}; case not important), plus ${BODY} (text body of the message).
  final String? content;

  /// Optional - Either "*" or a comma-separated list of header names.
  final String? origHeaders;

  NotifyAction({this.address, this.subject, this.maxBodySize, this.content, this.origHeaders, super.index});

  factory NotifyAction.fromJson(Map<String, dynamic> json) => NotifyAction(
        address: json['a'],
        subject: json['su'],
        maxBodySize: json['maxBodySize'],
        content: json['content']?['_content'],
        origHeaders: json['origHeaders'],
        index: json['index'],
      );

  @override
  Map<String, dynamic> toJson() => {
        if (address != null) 'a': address,
        if (subject != null) 'su': subject,
        if (maxBodySize != null) 'maxBodySize': maxBodySize,
        if (content != null) 'content': {'_content': content},
        if (origHeaders != null) 'origHeaders': origHeaders,
        if (index != null) 'index': index,
      };
}

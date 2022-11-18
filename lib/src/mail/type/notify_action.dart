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

  const NotifyAction({this.address, this.subject, this.maxBodySize, this.content, this.origHeaders, super.index});

  factory NotifyAction.fromMap(Map<String, dynamic> data) => NotifyAction(
      address: data['a'],
      subject: data['su'],
      maxBodySize: int.tryParse(data['maxBodySize']?.toString() ?? ''),
      content: data['content']?['_content'],
      origHeaders: data['origHeaders'],
      index: int.tryParse(data['index']?.toString() ?? ''));

  @override
  Map<String, dynamic> toMap() => {
        if (address != null) 'a': address,
        if (subject != null) 'su': subject,
        if (maxBodySize != null) 'maxBodySize': maxBodySize,
        if (content != null) 'content': {'_content': content},
        if (origHeaders != null) 'origHeaders': origHeaders,
        if (index != null) 'index': index,
      };
}

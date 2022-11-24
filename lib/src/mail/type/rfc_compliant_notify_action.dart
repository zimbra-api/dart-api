// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_action.dart';

class RFCCompliantNotifyAction extends FilterAction {
  /// Notify Tag ":from"
  final String? from;

  /// Notify Tag ":importance"
  final String? importance;

  /// Notify Tag ":options"
  final String? options;

  /// Notify Tag ":message"
  final String? message;

  /// Notify Parameter "method"
  final String? method;

  const RFCCompliantNotifyAction({
    this.from,
    this.importance,
    this.options,
    this.message,
    this.method,
    super.index,
  });

  factory RFCCompliantNotifyAction.fromMap(Map<String, dynamic> data) => RFCCompliantNotifyAction(
      from: data['from'],
      importance: data['importance'],
      options: data['options'],
      message: data['message'],
      method: data['method']?['_content'],
      index: int.tryParse(data['index']?.toString() ?? ''));

  @override
  Map<String, dynamic> toMap() => {
        if (from != null) 'from': from,
        if (importance != null) 'importance': importance,
        if (options != null) 'options': options,
        if (message != null) 'message': message,
        if (method != null) 'method': {'_content': method},
        if (index != null) 'index': index,
      };
}

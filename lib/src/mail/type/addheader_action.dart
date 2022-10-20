// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_action.dart';

class AddheaderAction extends FilterAction {
  /// New header name
  final String? headerName;

  /// New header value
  final String? headerValue;

  /// Last header
  final bool? last;

  AddheaderAction({this.headerName, this.headerValue, this.last, super.index});

  factory AddheaderAction.fromJson(Map<String, dynamic> json) => AddheaderAction(
      headerName: json['headerName']?['_content'],
      headerValue: json['headerValue']?['_content'],
      last: json['last'],
      index: json['index']);

  @override
  Map<String, dynamic> toJson() => {
        if (headerName != null) 'headerName': {'_content': headerName},
        if (headerValue != null) 'headerValue': {'_content': headerValue},
        if (last != null) 'last': last,
        if (index != null) 'index': index,
      };
}

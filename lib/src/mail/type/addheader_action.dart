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

  factory AddheaderAction.fromMap(Map<String, dynamic> data) => AddheaderAction(
      headerName: data['headerName']?['_content'],
      headerValue: data['headerValue']?['_content'],
      last: data['last'],
      index: data['index']);

  @override
  Map<String, dynamic> toMap() => {
        if (headerName != null) 'headerName': {'_content': headerName},
        if (headerValue != null) 'headerValue': {'_content': headerValue},
        if (last != null) 'last': last,
        if (index != null) 'index': index,
      };
}

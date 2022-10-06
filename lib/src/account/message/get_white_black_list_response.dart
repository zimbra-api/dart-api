// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetWhiteBlackListResponse extends SoapResponse {
  /// White list
  final List<String> whiteListEntries;

  /// Black list
  final List<String> blackListEntries;

  GetWhiteBlackListResponse([this.whiteListEntries = const <String>[], this.blackListEntries = const <String>[]]);

  factory GetWhiteBlackListResponse.fromJson(Map<String, dynamic> json) {
    final response = GetWhiteBlackListResponse();

    if (json['whiteList'] != null && json['whiteList'] is Iterable) {
      final whiteList = json['whiteList']['addr'] as Iterable;
      for (final entry in whiteList) {
        response.whiteListEntries.add(entry['_content']);
      }
    }

    if (json['blackList'] != null && json['blackList'] is Iterable) {
      final blackList = json['blackList']['addr'] as Iterable;
      for (final entry in blackList) {
        response.blackListEntries.add(entry['_content']);
      }
    }

    return response;
  }
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetWhiteBlackListResponse extends SoapResponse {
  /// White list
  final List<String> whiteListEntries;

  /// Black list
  final List<String> blackListEntries;

  GetWhiteBlackListResponse({this.whiteListEntries = const [], this.blackListEntries = const []});

  factory GetWhiteBlackListResponse.fromJson(Map<String, dynamic> json) {
    final whiteListEntries = <String>[];
    if (json['whiteList'] != null && json['whiteList'] is Map<String, dynamic>) {
      final whiteList = json['whiteList']['addr'] as Iterable;
      for (final entry in whiteList) {
        whiteListEntries.add(entry['_content']);
      }
    }

    final blackListEntries = <String>[];
    if (json['blackList'] != null && json['blackList'] is Map<String, dynamic>) {
      final blackList = json['blackList']['addr'] as Iterable;
      for (final entry in blackList) {
        blackListEntries.add(entry['_content']);
      }
    }

    return GetWhiteBlackListResponse(whiteListEntries: whiteListEntries, blackListEntries: blackListEntries);
  }
}

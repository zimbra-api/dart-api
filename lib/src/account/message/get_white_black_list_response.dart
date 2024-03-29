// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class GetWhiteBlackListResponse extends SoapResponse {
  /// White list
  final List<String> whiteListEntries;

  /// Black list
  final List<String> blackListEntries;

  GetWhiteBlackListResponse({
    this.whiteListEntries = const [],
    this.blackListEntries = const [],
  });

  factory GetWhiteBlackListResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetWhiteBlackListResponse(
        whiteListEntries: (data['whiteList'] is Iterable)
            ? (data['whiteList'] as Iterable)
                .map<String>(
                  (entry) => entry['_content'] ?? '',
                )
                .toList(growable: false)
            : const [],
        blackListEntries: (data['blackList'] is Iterable)
            ? (data['blackList'] as Iterable)
                .map<String>(
                  (entry) => entry['_content'] ?? '',
                )
                .toList(growable: false)
            : const [],
      );
}

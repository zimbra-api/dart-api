// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/share_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetShareInfoResponse extends SoapResponse {
  final List<ShareInfo> shares;

  GetShareInfoResponse({this.shares = const <ShareInfo>[]});

  factory GetShareInfoResponse.fromJson(Map<String, dynamic> json) {
    final response = GetShareInfoResponse();

    if (json['share'] != null && json['share'] is Iterable) {
      final shares = json['share'] as Iterable;
      for (final share in shares) {
        response.shares.add(ShareInfo.fromJson(share));
      }
    }

    return response;
  }
}

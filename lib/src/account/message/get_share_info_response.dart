// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/share_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetShareInfoResponse extends SoapResponse {
  final List<ShareInfo> shares;

  GetShareInfoResponse({this.shares = const []});

  factory GetShareInfoResponse.fromMap(Map<String, dynamic> data) => GetShareInfoResponse(
      shares: (data['share'] is Iterable)
          ? List.from((data['share'] as Iterable).map<ShareInfo>((share) => ShareInfo.fromMap(share)))
          : []);
}

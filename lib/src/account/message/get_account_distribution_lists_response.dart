// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/dl_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetAccountDistributionListsResponse extends SoapResponse {
  /// Information on distribution lists
  final List<DLInfo> dlList;

  GetAccountDistributionListsResponse({this.dlList = const []});

  factory GetAccountDistributionListsResponse.fromJson(Map<String, dynamic> json) {
    final dlList = <DLInfo>[];
    if (json['dl'] != null && json['dl'] is Iterable) {
      final dls = json['dl'] as Iterable;
      for (final dl in dls) {
        dlList.add(DLInfo.fromJson(dl));
      }
    }

    return GetAccountDistributionListsResponse(dlList: dlList);
  }
}

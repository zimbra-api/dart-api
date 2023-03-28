// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/dl_info.dart';

class GetAccountDistributionListsResponse extends SoapResponse {
  /// Information on distribution lists
  final List<DLInfo> dlList;

  GetAccountDistributionListsResponse({this.dlList = const []});

  factory GetAccountDistributionListsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetAccountDistributionListsResponse(
        dlList: (data['dl'] is Iterable)
            ? (data['dl'] as Iterable)
                .map<DLInfo>(
                  (dl) => DLInfo.fromMap(dl),
                )
                .toList(growable: false)
            : const [],
      );
}

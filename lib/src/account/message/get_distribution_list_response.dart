// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/distribution_list_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetDistributionListResponse extends SoapResponse {
  /// Information about distribution list
  final DistributionListInfo? dl;

  GetDistributionListResponse({this.dl});

  factory GetDistributionListResponse.fromJson(Map<String, dynamic> json) =>
      GetDistributionListResponse(dl: json['dl'] is Map ? DistributionListInfo.fromJson(json['dl']) : null);
}

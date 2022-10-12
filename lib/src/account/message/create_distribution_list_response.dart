// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/dl_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class CreateDistributionListResponse extends SoapResponse {
  /// Information about the newly created distribution list
  final DLInfo? dl;

  CreateDistributionListResponse({this.dl});

  factory CreateDistributionListResponse.fromJson(Map<String, dynamic> json) =>
      CreateDistributionListResponse(dl: json['dl'] is Map ? DLInfo.fromJson(json['dl']) : null);
}

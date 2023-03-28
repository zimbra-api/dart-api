// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/dl_info.dart';

class CreateDistributionListResponse extends SoapResponse {
  /// Information about the newly created distribution list
  final DLInfo? dl;

  CreateDistributionListResponse({this.dl});

  factory CreateDistributionListResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      CreateDistributionListResponse(
        dl: data['dl'] is Map ? DLInfo.fromMap(data['dl']) : null,
      );
}

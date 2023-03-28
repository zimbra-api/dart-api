// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/distribution_list_subscribe_status.dart';
import '../../common/type/soap_response.dart';

class SubscribeDistributionListResponse extends SoapResponse {
  /// Status of subscription attempt
  final DistributionListSubscribeStatus status;

  SubscribeDistributionListResponse(this.status);

  factory SubscribeDistributionListResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      SubscribeDistributionListResponse(
        DistributionListSubscribeStatus.values.firstWhere(
          (status) => status.name == data['status'],
          orElse: () => DistributionListSubscribeStatus.awaitingApproval,
        ),
      );
}

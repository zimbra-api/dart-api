// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'distribution_list_action_request.dart';
import 'distribution_list_action_response.dart';

class DistributionListActionBody extends SoapBody {
  DistributionListActionBody(
      {DistributionListActionRequest? request, DistributionListActionResponse? response})
      : super(request: request, response: response);

  factory DistributionListActionBody.fromMap(Map<String, dynamic> data) => DistributionListActionBody(
      response: data['DistributionListActionResponse'] != null
          ? DistributionListActionResponse.fromMap(data['DistributionListActionResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'DistributionListActionRequest': request!.toMap(),
      };
}

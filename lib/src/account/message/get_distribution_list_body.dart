// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_distribution_list_request.dart';
import 'get_distribution_list_response.dart';

class GetDistributionListBody extends SoapBody {
  GetDistributionListBody({
    GetDistributionListRequest? request,
    GetDistributionListResponse? response,
  }) : super(request: request, response: response);

  factory GetDistributionListBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetDistributionListBody(
        response: data['GetDistributionListResponse'] != null
            ? GetDistributionListResponse.fromMap(
                data['GetDistributionListResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetDistributionListRequest': request!.toMap(),
      };
}

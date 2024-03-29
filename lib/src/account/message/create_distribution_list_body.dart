// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'create_distribution_list_request.dart';
import 'create_distribution_list_response.dart';

class CreateDistributionListBody extends SoapBody {
  CreateDistributionListBody({
    CreateDistributionListRequest? request,
    CreateDistributionListResponse? response,
  }) : super(request: request, response: response);

  factory CreateDistributionListBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      CreateDistributionListBody(
        response: data['CreateDistributionListResponse'] != null
            ? CreateDistributionListResponse.fromMap(
                data['CreateDistributionListResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateDistributionListRequest': request!.toMap(),
      };
}

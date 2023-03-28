// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_account_distribution_lists_request.dart';
import 'get_account_distribution_lists_response.dart';

class GetAccountDistributionListsBody extends SoapBody {
  GetAccountDistributionListsBody({
    GetAccountDistributionListsRequest? request,
    GetAccountDistributionListsResponse? response,
  }) : super(request: request, response: response);

  factory GetAccountDistributionListsBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetAccountDistributionListsBody(
        response: data['GetAccountDistributionListsResponse'] != null
            ? GetAccountDistributionListsResponse.fromMap(
                data['GetAccountDistributionListsResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null)
          'GetAccountDistributionListsRequest': request!.toMap(),
      };
}

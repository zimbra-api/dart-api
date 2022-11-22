// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_distribution_list_members_request.dart';
import 'get_distribution_list_members_response.dart';

class GetDistributionListMembersBody extends SoapBody {
  GetDistributionListMembersBody(
      {GetDistributionListMembersRequest? request, GetDistributionListMembersResponse? response})
      : super(request: request, response: response);

  factory GetDistributionListMembersBody.fromMap(Map<String, dynamic> data) => GetDistributionListMembersBody(
      response: data['GetDistributionListMembersResponse'] != null
          ? GetDistributionListMembersResponse.fromMap(data['GetDistributionListMembersResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetDistributionListMembersRequest': request!.toMap(),
      };
}

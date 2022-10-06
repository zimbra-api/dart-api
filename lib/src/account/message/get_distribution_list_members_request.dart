// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_distribution_list_members_body.dart';
import 'get_distribution_list_members_envelope.dart';

/// Get the list of members of a distribution list.
class GetDistributionListMembersRequest extends SoapRequest {
  /// The name of the distribution list
  String dl;

  /// The number of members to return (0 is default and means all)
  int? limit;

  /// The starting offset (0, 25, etc)
  int? offset;

  GetDistributionListMembersRequest(this.dl, {this.limit, this.offset});

  @override
  SoapEnvelope getEnvelope() => GetDistributionListMembersEnvelope(GetDistributionListMembersBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        'dl': {'_content': dl},
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_distribution_list_members_body.dart';

class GetDistributionListMembersEnvelope extends SoapEnvelope {
  GetDistributionListMembersEnvelope(GetDistributionListMembersBody body, {super.header}) : super(body);

  factory GetDistributionListMembersEnvelope.fromJson(Map<String, dynamic> json) =>
      GetDistributionListMembersEnvelope(GetDistributionListMembersBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetDistributionListMembersBody get getDistributionListMembersBody => body as GetDistributionListMembersBody;
}

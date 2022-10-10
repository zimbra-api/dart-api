// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/distribution_list_selector.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_distribution_list_body.dart';
import 'get_distribution_list_envelope.dart';

/// Get a distribution list, optionally with ownership information an granted rights.
class GetDistributionListRequest extends SoapRequest {
  /// Specify the distribution list
  final DistributionListSelector dl;

  /// Whether to return owners, default is 0 (i.e. Don't return owners)
  final bool? needOwners;

  /// return grants for the specified (comma-seperated) rights. e.g. needRights="sendToDistList,viewDistList"
  final bool? needRights;

  GetDistributionListRequest(this.dl, {this.needOwners, this.needRights});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetDistributionListEnvelope(GetDistributionListBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        'dl': dl.toJson(),
        if (needOwners != null) 'needOwners': needOwners,
        if (needRights != null) 'needRights': needRights,
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/distribution_list_action.dart';
import 'package:zimbra_api/src/common/type/distribution_list_selector.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'distribution_list_action_body.dart';
import 'distribution_list_action_envelope.dart';

/// Perform an action on a Distribution List
/// Notes:
///   - Authorized account must be one of the list owners
///   - For owners/rights, only grants on the group itself will be modified,
///     grants on domain and globalgrant (from which the right can be inherited) will not be touched.
///     Only admins can modify grants on domains and globalgrant, owners of groups
///     can only modify grants on the group entry.
class DistributionListActionRequest extends SoapRequest {
  /// Identifies the distribution list to act upon
  DistributionListSelector dl;

  /// Specifies the action to perform
  DistributionListAction action;

  DistributionListActionRequest(this.dl, this.action);

  @override
  SoapEnvelope getEnvelope() => DistributionListActionEnvelope(DistributionListActionBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        'dl': dl.toJson(),
        'action': action.toJson(),
      };
}

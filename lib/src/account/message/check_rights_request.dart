// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/check_rights_target_spec.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'check_rights_body.dart';
import 'check_rights_envelope.dart';

/// Check if the authed user has the specified right(s) on a target.
class CheckRightsRequest extends SoapRequest {
  /// The targets
  final List<CheckRightsTargetSpec> targets;

  CheckRightsRequest({this.targets = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => CheckRightsEnvelope(CheckRightsBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        if (targets.isNotEmpty) 'target': targets.map((pref) => pref.toJson()).toList(),
      };
}

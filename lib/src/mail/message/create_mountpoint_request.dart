// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/new_mountpoint_spec.dart';

import 'create_mountpoint_body.dart';
import 'create_mountpoint_envelope.dart';

/// Create mountpoint
class CreateMountpointRequest extends SoapRequest {
  /// New mountpoint specification
  final NewMountpointSpec mountpoint;

  CreateMountpointRequest(this.mountpoint);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CreateMountpointEnvelope(CreateMountpointBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'link': mountpoint.toJson(),
      };
}
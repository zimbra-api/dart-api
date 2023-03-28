// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/new_mountpoint_spec.dart';
import 'create_mountpoint_body.dart';
import 'create_mountpoint_envelope.dart';

/// Create mountpoint
class CreateMountpointRequest extends SoapRequest {
  /// New mountpoint specification
  final NewMountpointSpec mountpoint;

  CreateMountpointRequest(this.mountpoint);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => CreateMountpointEnvelope(
        CreateMountpointBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'link': mountpoint.toMap(),
      };
}

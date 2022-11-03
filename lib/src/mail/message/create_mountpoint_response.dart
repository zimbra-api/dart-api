// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/mountpoint.dart';

class CreateMountpointResponse extends SoapResponse {
  /// Details of the created mountpoint
  final Mountpoint? mountpoint;

  CreateMountpointResponse({this.mountpoint});

  factory CreateMountpointResponse.fromMap(Map<String, dynamic> data) =>
      CreateMountpointResponse(mountpoint: data['link'] is Map ? Mountpoint.fromMap(data['link']) : null);
}

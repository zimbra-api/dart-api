// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_mountpoint_request.dart';
import 'create_mountpoint_response.dart';

class CreateMountpointBody extends SoapBody {
  CreateMountpointBody({CreateMountpointRequest? request, CreateMountpointResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateMountpointBody.fromJson(Map<String, dynamic> json) => CreateMountpointBody(
      response: json['CreateMountpointResponse'] != null
          ? CreateMountpointResponse.fromJson(json['CreateMountpointResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateMountpointRequest? get createMountpointRequest => request as CreateMountpointRequest?;

  CreateMountpointResponse? get createMountpointResponse => response as CreateMountpointResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateMountpointRequest': request!.toJson(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'create_mountpoint_request.dart';
import 'create_mountpoint_response.dart';

class CreateMountpointBody extends SoapBody {
  CreateMountpointBody(
      {CreateMountpointRequest? request, CreateMountpointResponse? response})
      : super(request: request, response: response);

  factory CreateMountpointBody.fromMap(Map<String, dynamic> data) =>
      CreateMountpointBody(
          response: data['CreateMountpointResponse'] != null
              ? CreateMountpointResponse.fromMap(
                  data['CreateMountpointResponse'])
              : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateMountpointRequest': request!.toMap(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_profile_image_request.dart';
import 'modify_profile_image_response.dart';

class ModifyProfileImageBody extends SoapBody {
  ModifyProfileImageBody({ModifyProfileImageRequest? request, ModifyProfileImageResponse? response, super.fault})
      : super(request: request, response: response);

  factory ModifyProfileImageBody.fromJson(Map<String, dynamic> json) => ModifyProfileImageBody(
      response: json['ModifyProfileImageResponse'] != null
          ? ModifyProfileImageResponse.fromJson(json['ModifyProfileImageResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ModifyProfileImageRequest? get modifyProfileImageRequest => request as ModifyProfileImageRequest?;

  ModifyProfileImageResponse? get modifyProfileImageResponse => response as ModifyProfileImageResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ModifyProfileImageRequest': request!.toJson(),
      };
}

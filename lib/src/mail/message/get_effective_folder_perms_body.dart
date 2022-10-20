// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_effective_folder_perms_request.dart';
import 'get_effective_folder_perms_response.dart';

class GetEffectiveFolderPermsBody extends SoapBody {
  GetEffectiveFolderPermsBody(
      {GetEffectiveFolderPermsRequest? request, GetEffectiveFolderPermsResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetEffectiveFolderPermsBody.fromJson(Map<String, dynamic> json) => GetEffectiveFolderPermsBody(
      response: json['GetEffectiveFolderPermsResponse'] != null
          ? GetEffectiveFolderPermsResponse.fromJson(json['GetEffectiveFolderPermsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetEffectiveFolderPermsRequest? get getEffectiveFolderPermsRequest => request as GetEffectiveFolderPermsRequest?;

  GetEffectiveFolderPermsResponse? get getEffectiveFolderPermsResponse => response as GetEffectiveFolderPermsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetEffectiveFolderPermsRequest': request!.toJson(),
      };
}

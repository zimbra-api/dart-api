// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_effective_folder_perms_request.dart';
import 'get_effective_folder_perms_response.dart';

class GetEffectiveFolderPermsBody extends SoapBody {
  GetEffectiveFolderPermsBody(
      {GetEffectiveFolderPermsRequest? request, GetEffectiveFolderPermsResponse? response})
      : super(request: request, response: response);

  factory GetEffectiveFolderPermsBody.fromMap(Map<String, dynamic> data) => GetEffectiveFolderPermsBody(
      response: data['GetEffectiveFolderPermsResponse'] != null
          ? GetEffectiveFolderPermsResponse.fromMap(data['GetEffectiveFolderPermsResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetEffectiveFolderPermsRequest': request!.toMap(),
      };
}

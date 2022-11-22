// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'modify_zimlet_prefs_request.dart';
import 'modify_zimlet_prefs_response.dart';

class ModifyZimletPrefsBody extends SoapBody {
  ModifyZimletPrefsBody({ModifyZimletPrefsRequest? request, ModifyZimletPrefsResponse? response})
      : super(request: request, response: response);

  factory ModifyZimletPrefsBody.fromMap(Map<String, dynamic> data) => ModifyZimletPrefsBody(
      response: data['ModifyZimletPrefsResponse'] != null
          ? ModifyZimletPrefsResponse.fromMap(data['ModifyZimletPrefsResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyZimletPrefsRequest': request!.toMap(),
      };
}

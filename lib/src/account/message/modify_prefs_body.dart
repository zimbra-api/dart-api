// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'modify_prefs_request.dart';
import 'modify_prefs_response.dart';

class ModifyPrefsBody extends SoapBody {
  ModifyPrefsBody({
    ModifyPrefsRequest? request,
    ModifyPrefsResponse? response,
  }) : super(request: request, response: response);

  factory ModifyPrefsBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      ModifyPrefsBody(
        response: data['ModifyPrefsResponse'] != null
            ? ModifyPrefsResponse.fromMap(
                data['ModifyPrefsResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyPrefsRequest': request!.toMap(),
      };
}

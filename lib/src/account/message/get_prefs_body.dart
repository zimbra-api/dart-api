// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_prefs_request.dart';
import 'get_prefs_response.dart';

class GetPrefsBody extends SoapBody {
  GetPrefsBody({GetPrefsRequest? request, GetPrefsResponse? response})
      : super(request: request, response: response);

  factory GetPrefsBody.fromMap(Map<String, dynamic> data) => GetPrefsBody(
      response: data['GetPrefsResponse'] != null ? GetPrefsResponse.fromMap(data['GetPrefsResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetPrefsRequest': request!.toMap(),
      };
}

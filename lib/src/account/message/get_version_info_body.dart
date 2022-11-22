// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_version_info_request.dart';
import 'get_version_info_response.dart';

class GetVersionInfoBody extends SoapBody {
  GetVersionInfoBody({GetVersionInfoRequest? request, GetVersionInfoResponse? response})
      : super(request: request, response: response);

  factory GetVersionInfoBody.fromMap(Map<String, dynamic> data) => GetVersionInfoBody(
      response: data['GetVersionInfoResponse'] != null
          ? GetVersionInfoResponse.fromMap(data['GetVersionInfoResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetVersionInfoRequest': request!.toMap(),
      };
}

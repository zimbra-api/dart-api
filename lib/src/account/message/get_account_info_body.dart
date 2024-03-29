// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_account_info_request.dart';
import 'get_account_info_response.dart';

class GetAccountInfoBody extends SoapBody {
  GetAccountInfoBody({
    GetAccountInfoRequest? request,
    GetAccountInfoResponse? response,
  }) : super(request: request, response: response);

  factory GetAccountInfoBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetAccountInfoBody(
        response: data['GetAccountInfoResponse'] != null
            ? GetAccountInfoResponse.fromMap(data['GetAccountInfoResponse'])
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetAccountInfoRequest': request!.toMap(),
      };
}

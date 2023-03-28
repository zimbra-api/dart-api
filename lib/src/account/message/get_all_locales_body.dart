// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_all_locales_request.dart';
import 'get_all_locales_response.dart';

class GetAllLocalesBody extends SoapBody {
  GetAllLocalesBody({
    GetAllLocalesRequest? request,
    GetAllLocalesResponse? response,
  }) : super(request: request, response: response);

  factory GetAllLocalesBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetAllLocalesBody(
        response: data['GetAllLocalesResponse'] != null
            ? GetAllLocalesResponse.fromMap(
                data['GetAllLocalesResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetAllLocalesRequest': request!.toMap(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_all_locales_request.dart';
import 'get_all_locales_response.dart';

class GetAllLocalesBody extends SoapBody {
  GetAllLocalesBody({GetAllLocalesRequest? request, GetAllLocalesResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetAllLocalesBody.fromMap(Map<String, dynamic> data) => GetAllLocalesBody(
      response:
          data['GetAllLocalesResponse'] != null ? GetAllLocalesResponse.fromMap(data['GetAllLocalesResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  GetAllLocalesRequest? get getAllLocalesRequest => request as GetAllLocalesRequest?;

  GetAllLocalesResponse? get getAllLocalesResponse => response as GetAllLocalesResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetAllLocalesRequest': request!.toMap(),
      };
}

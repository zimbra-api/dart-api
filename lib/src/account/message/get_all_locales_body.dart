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

  factory GetAllLocalesBody.fromJson(Map<String, dynamic> json) => GetAllLocalesBody(
      response:
          json['GetAllLocalesResponse'] != null ? GetAllLocalesResponse.fromJson(json['GetAllLocalesResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetAllLocalesRequest? get getAllLocalesRequest => request as GetAllLocalesRequest;

  GetAllLocalesResponse? get getAllLocalesResponse => response as GetAllLocalesResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetAllLocalesRequest': request!.toJson(),
      };
}

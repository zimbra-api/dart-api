// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_available_csv_formats_request.dart';
import 'get_available_csv_formats_response.dart';

class GetAvailableCsvFormatsBody extends SoapBody {
  GetAvailableCsvFormatsBody(
      {GetAvailableCsvFormatsRequest? request, GetAvailableCsvFormatsResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory GetAvailableCsvFormatsBody.fromJson(Map<String, dynamic> json) => GetAvailableCsvFormatsBody(
      response: json['GetAvailableCsvFormatsResponse'] != null
          ? GetAvailableCsvFormatsResponse.fromJson(json['GetAvailableCsvFormatsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetAvailableCsvFormatsRequest? get getAvailableCsvFormatsRequest => request as GetAvailableCsvFormatsRequest;

  GetAvailableCsvFormatsResponse? get getAvailableCsvFormatsResponse => response as GetAvailableCsvFormatsResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetAvailableCsvFormatsRequest': request!.toJson(),
      };
}

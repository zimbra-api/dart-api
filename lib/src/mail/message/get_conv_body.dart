// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_conv_request.dart';
import 'get_conv_response.dart';

class GetConvBody extends SoapBody {
  GetConvBody({GetConvRequest? request, GetConvResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetConvBody.fromJson(Map<String, dynamic> json) => GetConvBody(
      response: json['GetConvResponse'] != null ? GetConvResponse.fromJson(json['GetConvResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetConvRequest? get getConvRequest => request as GetConvRequest?;

  GetConvResponse? get getConvResponse => response as GetConvResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetConvRequest': request!.toJson(),
      };
}
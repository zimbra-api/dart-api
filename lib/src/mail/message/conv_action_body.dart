// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'conv_action_request.dart';
import 'conv_action_response.dart';

class ConvActionBody extends SoapBody {
  ConvActionBody({ConvActionRequest? request, ConvActionResponse? response, super.fault})
      : super(request: request, response: response);

  factory ConvActionBody.fromJson(Map<String, dynamic> json) => ConvActionBody(
      response: json['ConvActionResponse'] != null ? ConvActionResponse.fromJson(json['ConvActionResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ConvActionRequest? get convActionRequest => request as ConvActionRequest?;

  ConvActionResponse? get convActionResponse => response as ConvActionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ConvActionRequest': request!.toJson(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_signatures_request.dart';
import 'get_signatures_response.dart';

class GetSignaturesBody extends SoapBody {
  GetSignaturesBody({GetSignaturesRequest? request, GetSignaturesResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetSignaturesBody.fromJson(Map<String, dynamic> json) => GetSignaturesBody(
      response:
          json['GetSignaturesResponse'] != null ? GetSignaturesResponse.fromJson(json['GetSignaturesResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetSignaturesRequest? get getSignaturesRequest => request as GetSignaturesRequest;

  GetSignaturesResponse? get getSignaturesResponse => response as GetSignaturesResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetSignaturesRequest': request!.toJson(),
      };
}

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

  factory GetSignaturesBody.fromMap(Map<String, dynamic> data) => GetSignaturesBody(
      response:
          data['GetSignaturesResponse'] != null ? GetSignaturesResponse.fromMap(data['GetSignaturesResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetSignaturesRequest': request!.toMap(),
      };
}

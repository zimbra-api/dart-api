// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'auto_complete_gal_request.dart';
import 'auto_complete_gal_response.dart';

class AutoCompleteGalBody extends SoapBody {
  AutoCompleteGalBody({AutoCompleteGalRequest? request, AutoCompleteGalResponse? response, super.fault})
      : super(request: request, response: response);

  factory AutoCompleteGalBody.fromJson(Map<String, dynamic> json) => AutoCompleteGalBody(
      response: json['AutoCompleteGalResponse'] != null
          ? AutoCompleteGalResponse.fromJson(json['AutoCompleteGalResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  AutoCompleteGalRequest? get autoCompleteGalRequest => request as AutoCompleteGalRequest;

  AutoCompleteGalResponse? get autoCompleteGalResponse => response as AutoCompleteGalResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'AutoCompleteGalRequest': request!.toJson(),
      };
}

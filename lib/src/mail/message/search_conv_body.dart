// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'search_conv_request.dart';
import 'search_conv_response.dart';

class SearchConvBody extends SoapBody {
  SearchConvBody({SearchConvRequest? request, SearchConvResponse? response, super.fault})
      : super(request: request, response: response);

  factory SearchConvBody.fromJson(Map<String, dynamic> json) => SearchConvBody(
      response: json['SearchConvResponse'] != null ? SearchConvResponse.fromJson(json['SearchConvResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SearchConvRequest? get searchConvRequest => request as SearchConvRequest?;

  SearchConvResponse? get searchConvResponse => response as SearchConvResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SearchConvRequest': request!.toJson(),
      };
}

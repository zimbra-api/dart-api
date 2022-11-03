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

  factory SearchConvBody.fromMap(Map<String, dynamic> data) => SearchConvBody(
      response: data['SearchConvResponse'] != null ? SearchConvResponse.fromMap(data['SearchConvResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SearchConvRequest': request!.toMap(),
      };
}

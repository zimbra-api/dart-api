// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_comments_request.dart';
import 'get_comments_response.dart';

class GetCommentsBody extends SoapBody {
  GetCommentsBody({GetCommentsRequest? request, GetCommentsResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetCommentsBody.fromJson(Map<String, dynamic> json) => GetCommentsBody(
      response: json['GetCommentsResponse'] != null ? GetCommentsResponse.fromJson(json['GetCommentsResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetCommentsRequest? get getCommentsRequest => request as GetCommentsRequest?;

  GetCommentsResponse? get getCommentsResponse => response as GetCommentsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetCommentsRequest': request!.toJson(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_tag_request.dart';
import 'get_tag_response.dart';

class GetTagBody extends SoapBody {
  GetTagBody({GetTagRequest? request, GetTagResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetTagBody.fromJson(Map<String, dynamic> json) => GetTagBody(
      response: json['GetTagResponse'] != null ? GetTagResponse.fromJson(json['GetTagResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetTagRequest? get getTagRequest => request as GetTagRequest?;

  GetTagResponse? get getTagResponse => response as GetTagResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetTagRequest': request!.toJson(),
      };
}

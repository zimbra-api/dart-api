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

  factory GetTagBody.fromMap(Map<String, dynamic> data) => GetTagBody(
      response: data['GetTagResponse'] != null ? GetTagResponse.fromMap(data['GetTagResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  GetTagRequest? get getTagRequest => request as GetTagRequest?;

  GetTagResponse? get getTagResponse => response as GetTagResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetTagRequest': request!.toMap(),
      };
}

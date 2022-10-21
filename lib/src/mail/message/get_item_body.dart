// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_item_request.dart';
import 'get_item_response.dart';

class GetItemBody extends SoapBody {
  GetItemBody({GetItemRequest? request, GetItemResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetItemBody.fromJson(Map<String, dynamic> json) => GetItemBody(
      response: json['GetItemResponse'] != null ? GetItemResponse.fromJson(json['GetItemResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetItemRequest? get getItemRequest => request as GetItemRequest?;

  GetItemResponse? get getItemResponse => response as GetItemResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetItemRequest': request!.toJson(),
      };
}

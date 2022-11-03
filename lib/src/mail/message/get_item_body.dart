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

  factory GetItemBody.fromMap(Map<String, dynamic> data) => GetItemBody(
      response: data['GetItemResponse'] != null ? GetItemResponse.fromMap(data['GetItemResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetItemRequest': request!.toMap(),
      };
}

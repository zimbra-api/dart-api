// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'item_action_request.dart';
import 'item_action_response.dart';

class ItemActionBody extends SoapBody {
  ItemActionBody({ItemActionRequest? request, ItemActionResponse? response, super.fault})
      : super(request: request, response: response);

  factory ItemActionBody.fromMap(Map<String, dynamic> data) => ItemActionBody(
      response: data['ItemActionResponse'] != null ? ItemActionResponse.fromMap(data['ItemActionResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ItemActionRequest': request!.toMap(),
      };
}

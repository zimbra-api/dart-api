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

  factory ItemActionBody.fromJson(Map<String, dynamic> json) => ItemActionBody(
      response: json['ItemActionResponse'] != null ? ItemActionResponse.fromJson(json['ItemActionResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ItemActionRequest? get itemActionRequest => request as ItemActionRequest?;

  ItemActionResponse? get itemActionResponse => response as ItemActionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ItemActionRequest': request!.toJson(),
      };
}

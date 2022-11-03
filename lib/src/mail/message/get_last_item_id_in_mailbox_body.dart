// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_last_item_id_in_mailbox_request.dart';
import 'get_last_item_id_in_mailbox_response.dart';

class GetLastItemIdInMailboxBody extends SoapBody {
  GetLastItemIdInMailboxBody(
      {GetLastItemIdInMailboxRequest? request, GetLastItemIdInMailboxResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetLastItemIdInMailboxBody.fromMap(Map<String, dynamic> data) => GetLastItemIdInMailboxBody(
      response: data['GetLastItemIdInMailboxResponse'] != null
          ? GetLastItemIdInMailboxResponse.fromMap(data['GetLastItemIdInMailboxResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetLastItemIdInMailboxRequest': request!.toMap(),
      };
}

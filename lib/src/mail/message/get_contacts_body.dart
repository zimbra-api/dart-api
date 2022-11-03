// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_contacts_request.dart';
import 'get_contacts_response.dart';

class GetContactsBody extends SoapBody {
  GetContactsBody({GetContactsRequest? request, GetContactsResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetContactsBody.fromMap(Map<String, dynamic> data) => GetContactsBody(
      response: data['GetContactsResponse'] != null ? GetContactsResponse.fromMap(data['GetContactsResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  GetContactsRequest? get getContactsRequest => request as GetContactsRequest?;

  GetContactsResponse? get getContactsResponse => response as GetContactsResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetContactsRequest': request!.toMap(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'restore_contacts_request.dart';
import 'restore_contacts_response.dart';

class RestoreContactsBody extends SoapBody {
  RestoreContactsBody({RestoreContactsRequest? request, RestoreContactsResponse? response, super.fault})
      : super(request: request, response: response);

  factory RestoreContactsBody.fromJson(Map<String, dynamic> json) => RestoreContactsBody(
      response: json['RestoreContactsResponse'] != null
          ? RestoreContactsResponse.fromJson(json['RestoreContactsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  RestoreContactsRequest? get restoreContactsRequest => request as RestoreContactsRequest?;

  RestoreContactsResponse? get restoreContactsResponse => response as RestoreContactsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'RestoreContactsRequest': request!.toJson(),
      };
}

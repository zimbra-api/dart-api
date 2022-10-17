// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_contact_request.dart';
import 'create_contact_response.dart';

class CreateContactBody extends SoapBody {
  CreateContactBody({CreateContactRequest? request, CreateContactResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateContactBody.fromJson(Map<String, dynamic> json) => CreateContactBody(
      response:
          json['CreateContactResponse'] != null ? CreateContactResponse.fromJson(json['CreateContactResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateContactRequest? get createContactRequest => request as CreateContactRequest?;

  CreateContactResponse? get createContactResponse => response as CreateContactResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateContactRequest': request!.toJson(),
      };
}

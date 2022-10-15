// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'contact_action_request.dart';
import 'contact_action_response.dart';

class ContactActionBody extends SoapBody {
  ContactActionBody({ContactActionRequest? request, ContactActionResponse? response, super.fault})
      : super(request: request, response: response);

  factory ContactActionBody.fromJson(Map<String, dynamic> json) => ContactActionBody(
      response:
          json['ContactActionResponse'] != null ? ContactActionResponse.fromJson(json['ContactActionResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ContactActionRequest? get contactActionRequest => request as ContactActionRequest?;

  ContactActionResponse? get contactActionResponse => response as ContactActionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ContactActionRequest': request!.toJson(),
      };
}

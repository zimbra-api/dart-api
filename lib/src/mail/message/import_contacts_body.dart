// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'import_contacts_request.dart';
import 'import_contacts_response.dart';

class ImportContactsBody extends SoapBody {
  ImportContactsBody({ImportContactsRequest? request, ImportContactsResponse? response, super.fault})
      : super(request: request, response: response);

  factory ImportContactsBody.fromJson(Map<String, dynamic> json) => ImportContactsBody(
      response: json['ImportContactsResponse'] != null
          ? ImportContactsResponse.fromJson(json['ImportContactsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ImportContactsRequest? get importContactsRequest => request as ImportContactsRequest?;

  ImportContactsResponse? get importContactsResponse => response as ImportContactsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ImportContactsRequest': request!.toJson(),
      };
}

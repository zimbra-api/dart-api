// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'export_contacts_request.dart';
import 'export_contacts_response.dart';

class ExportContactsBody extends SoapBody {
  ExportContactsBody({
    ExportContactsRequest? request,
    ExportContactsResponse? response,
  }) : super(request: request, response: response);

  factory ExportContactsBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      ExportContactsBody(
        response: data['ExportContactsResponse'] != null
            ? ExportContactsResponse.fromMap(
                data['ExportContactsResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ExportContactsRequest': request!.toMap(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'remove_attachments_request.dart';
import 'remove_attachments_response.dart';

class RemoveAttachmentsBody extends SoapBody {
  RemoveAttachmentsBody({RemoveAttachmentsRequest? request, RemoveAttachmentsResponse? response, super.fault})
      : super(request: request, response: response);

  factory RemoveAttachmentsBody.fromMap(Map<String, dynamic> data) => RemoveAttachmentsBody(
      response: data['RemoveAttachmentsResponse'] != null
          ? RemoveAttachmentsResponse.fromMap(data['RemoveAttachmentsResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  RemoveAttachmentsRequest? get removeAttachmentsRequest => request as RemoveAttachmentsRequest?;

  RemoveAttachmentsResponse? get removeAttachmentsResponse => response as RemoveAttachmentsResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'RemoveAttachmentsRequest': request!.toMap(),
      };
}

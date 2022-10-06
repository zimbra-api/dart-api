// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'delete_identity_request.dart';
import 'delete_identity_response.dart';

class DeleteIdentityBody extends SoapBody {
  DeleteIdentityBody({DeleteIdentityRequest? request, DeleteIdentityResponse? response, super.fault})
      : super(request: request, response: response);

  factory DeleteIdentityBody.fromJson(Map<String, dynamic> json) => DeleteIdentityBody(
      response: json['DeleteIdentityResponse'] != null
          ? DeleteIdentityResponse.fromJson(json['DeleteIdentityResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  DeleteIdentityRequest? get deleteIdentityRequest => request as DeleteIdentityRequest;

  DeleteIdentityResponse? get deleteIdentityResponse => response as DeleteIdentityResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'DeleteIdentityRequest': request!.toJson(),
      };
}

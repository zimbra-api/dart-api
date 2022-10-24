// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'recover_account_request.dart';
import 'recover_account_response.dart';

class RecoverAccountBody extends SoapBody {
  RecoverAccountBody({RecoverAccountRequest? request, RecoverAccountResponse? response, super.fault})
      : super(request: request, response: response);

  factory RecoverAccountBody.fromJson(Map<String, dynamic> json) => RecoverAccountBody(
      response: json['RecoverAccountResponse'] != null
          ? RecoverAccountResponse.fromJson(json['RecoverAccountResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  RecoverAccountRequest? get recoverAccountRequest => request as RecoverAccountRequest?;

  RecoverAccountResponse? get recoverAccountResponse => response as RecoverAccountResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'RecoverAccountRequest': request!.toJson(),
      };
}

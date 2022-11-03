// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'set_recovery_account_request.dart';
import 'set_recovery_account_response.dart';

class SetRecoveryAccountBody extends SoapBody {
  SetRecoveryAccountBody({SetRecoveryAccountRequest? request, SetRecoveryAccountResponse? response, super.fault})
      : super(request: request, response: response);

  factory SetRecoveryAccountBody.fromMap(Map<String, dynamic> data) => SetRecoveryAccountBody(
      response: data['SetRecoveryAccountResponse'] != null
          ? SetRecoveryAccountResponse.fromMap(data['SetRecoveryAccountResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  SetRecoveryAccountRequest? get setRecoveryAccountRequest => request as SetRecoveryAccountRequest?;

  SetRecoveryAccountResponse? get setRecoveryAccountResponse => response as SetRecoveryAccountResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SetRecoveryAccountRequest': request!.toMap(),
      };
}

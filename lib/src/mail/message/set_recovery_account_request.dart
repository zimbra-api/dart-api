// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/channel.dart';
import '../../common/enum/recovery_account_operation.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'set_recovery_account_body.dart';
import 'set_recovery_account_envelope.dart';

/// Set recover account request
class SetRecoveryAccountRequest extends SoapRequest {
  /// op can be sendCode, validateCode, resendCode or reset.
  final RecoveryAccountOperation operation;

  /// recovery account
  final String recoveryAccount;

  /// recovery account verification code
  final String verificationCode;

  /// recovery channel
  final Channel? channel;

  SetRecoveryAccountRequest(
    this.operation,
    this.recoveryAccount,
    this.verificationCode, {
    this.channel,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => SetRecoveryAccountEnvelope(
        SetRecoveryAccountBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'op': operation.name,
        'recoveryAccount': recoveryAccount,
        'recoveryAccountVerificationCode': verificationCode,
        if (channel != null) 'channel': channel!.name,
      };
}

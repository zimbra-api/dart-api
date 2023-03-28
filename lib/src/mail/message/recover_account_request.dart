// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/channel.dart';
import '../../common/enum/recover_account_operation.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'recover_account_body.dart';
import 'recover_account_envelope.dart';

/// Recover account
class RecoverAccountRequest extends SoapRequest {
  /// Email
  final String email;

  /// Operation
  final RecoverAccountOperation operation;

  /// Channel
  final Channel? channel;

  RecoverAccountRequest(
    this.email,
    this.operation, {
    this.channel,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => RecoverAccountEnvelope(
        RecoverAccountBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'email': email,
        'op': operation.name,
        if (channel != null) 'channel': channel!.name,
      };
}

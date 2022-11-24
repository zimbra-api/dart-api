// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/account_selector.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import 'change_password_body.dart';
import 'change_password_envelope.dart';

/// Change password request
class ChangePasswordRequest extends SoapRequest {
  /// Details of the account
  final AccountSelector account;

  /// Old password
  final String oldPassword;

  /// New password to assign
  final String password;

  /// specified virtual-host is used to determine the domain of the account name
  final String? virtualHost;

  final bool? dryRun;

  ChangePasswordRequest(
    this.account,
    this.oldPassword,
    this.password, {
    this.virtualHost,
    this.dryRun,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ChangePasswordEnvelope(ChangePasswordBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        'account': account.toMap(),
        'oldPassword': {'_content': oldPassword},
        'password': {'_content': password},
        if (virtualHost != null) 'virtualHost': {'_content': virtualHost},
        if (dryRun != null) 'dryRun': {'_content': dryRun},
      };
}

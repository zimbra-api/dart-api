// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/account_selector.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'change_password_body.dart';
import 'change_password_envelope.dart';

/// Change password request
class ChangePasswordRequest extends SoapRequest {
  /// Details of the account
  final AccountSelector account;

  /// Old password
  String oldPassword;

  /// New password to assign
  String password;

  /// specified virtual-host is used to determine the domain of the account name
  String? virtualHost;

  bool? dryRun;

  ChangePasswordRequest(this.account, this.oldPassword, this.password, {this.virtualHost, this.dryRun});

  @override
  SoapEnvelope getEnvelope() => ChangePasswordEnvelope(ChangePasswordBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        'account': account.toJson(),
        'oldPassword': oldPassword,
        'password': password,
        if (virtualHost != null) 'virtualHost': virtualHost,
        if (dryRun != null) 'dryRun': dryRun,
      };
}

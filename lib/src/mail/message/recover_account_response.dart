// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class RecoverAccountResponse extends SoapResponse {
  /// Recovery account
  final String? recoveryAccount;

  /// Attempts remaining before feature suspension
  final int? recoveryAttemptsLeft;

  RecoverAccountResponse({this.recoveryAccount, this.recoveryAttemptsLeft});

  factory RecoverAccountResponse.fromJson(Map<String, dynamic> json) => RecoverAccountResponse(
      recoveryAccount: json['recoveryAccount'], recoveryAttemptsLeft: json['recoveryAttemptsLeft']);
}

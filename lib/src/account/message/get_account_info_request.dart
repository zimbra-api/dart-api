// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/account_selector.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_account_info_body.dart';
import 'get_account_info_envelope.dart';

/// Get information about an account
class GetAccountInfoRequest extends SoapRequest {
  /// Use to identify the account
  final AccountSelector account;

  GetAccountInfoRequest(this.account);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetAccountInfoEnvelope(GetAccountInfoBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        'account': account.toJson(),
      };
}

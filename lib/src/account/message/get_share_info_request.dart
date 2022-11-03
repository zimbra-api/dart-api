// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/account_selector.dart';
import 'package:zimbra_api/src/common/type/grantee_chooser.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_share_info_body.dart';
import 'get_share_info_envelope.dart';

/// Get information about published shares
class GetShareInfoRequest extends SoapRequest {
  /// Filter by the specified grantee type
  final GranteeChooser? grantee;

  /// Specifies the owner of the share
  final AccountSelector? owner;

  /// Flags that have been proxied to this server because the specified "owner account" is
  /// homed here.  Do not proxy in this case. (Used internally by ZCS)
  final bool? internal;

  /// Flag whether own shares should be included:
  /// - false: if shares owned by the requested account should not be included in the response
  /// - true: (default) include shares owned by the requested account
  final bool? includeSelf;

  GetShareInfoRequest({this.grantee, this.owner, this.internal, this.includeSelf});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetShareInfoEnvelope(GetShareInfoBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        if (grantee != null) 'grantee': grantee!.toMap(),
        if (owner != null) 'owner': owner!.toMap(),
        if (internal != null) 'internal': internal,
        if (includeSelf != null) 'includeSelf': includeSelf,
      };
}

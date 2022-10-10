// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/named_value.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetAccountInfoResponse extends SoapResponse {
  /// Account name - an email address (user@domain)
  final String name;

  /// Account attributes.  Currently only these attributes are returned:
  /// zimbraId: the unique UUID of the zimbra account
  /// zimbraMailHost: the server on which this user's mail resides
  /// displayName: display name for the account
  final List<NamedValue> attrs;

  /// URL to talk to for soap service for this account.
  final String? soapURL;

  /// Base public URL for the requested account
  final String? publicURL;

  /// URL to talk to in order to change a password.
  /// Not returned if not configured via domain attribute zimbraChangePasswordURL
  final String? changePasswordURL;

  /// Zimbra Community URL to load in Community tab.
  final String? communityURL;

  /// Base URL for accessing the admin console
  final String? adminURL;

  /// Proxy URL for accessing XMPP over BOSH.
  /// Should be returned only when zimbraFeatureChatEnabled is set to TRUE for Account/COS
  final String? boshURL;

  GetAccountInfoResponse(this.name,
      {this.attrs = const [],
      this.soapURL,
      this.publicURL,
      this.changePasswordURL,
      this.communityURL,
      this.adminURL,
      this.boshURL});

  factory GetAccountInfoResponse.fromJson(Map<String, dynamic> json) {
    final attrs = <NamedValue>[];
    if (json['attr'] != null && json['attr'] is Iterable) {
      final elements = json['attr'] as Iterable;
      for (final attr in elements) {
        attrs.add(NamedValue.fromJson(attr));
      }
    }

    return GetAccountInfoResponse(json['name'],
        attrs: attrs,
        soapURL: json['soapURL'],
        publicURL: json['publicURL'],
        changePasswordURL: json['changePasswordURL'],
        communityURL: json['communityURL'],
        adminURL: json['adminURL'],
        boshURL: json['boshURL']);
  }
}

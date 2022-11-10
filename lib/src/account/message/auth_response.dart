// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/attr.dart';
import 'package:zimbra_api/src/account/type/pref.dart';
import 'package:zimbra_api/src/account/type/session.dart';
import 'package:zimbra_api/src/account/utils.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class AuthResponse extends SoapResponse {
  /// The authorization token
  final String? authToken;

  /// Life time for the authorization
  final int? lifetime;

  /// trust lifetime, if a trusted token is issued
  final int? trustLifetime;

  /// Session information
  final Session? session;

  /// host additional SOAP requests should be directed to.
  /// Always returned, might be same as original host request was sent to.
  final String? refer;

  /// if requestedSkin specified, the name of the skin to use Always returned,
  /// might be same as original host request was sent to.
  final String? skin;

  /// if client is CSRF token enabled, the CSRF token Returned only when client says it is CSRF enabled.
  final String? csrfToken;

  /// random secure device ID generated for the requesting device
  final String? deviceId;

  /// trusted device token
  final String? trustedToken;

  /// indicates whether the authentication account acts as a "Proxy" to a Zimbra account on another system.
  final bool? zmgProxy;

  final List<Pref> prefs;

  final List<Attr> attrs;

  final bool? twoFactorAuthRequired;

  final bool? trustedDevicesEnabled;

  AuthResponse(
      {this.authToken,
      this.lifetime,
      this.trustLifetime,
      this.session,
      this.refer,
      this.skin,
      this.csrfToken,
      this.deviceId,
      this.trustedToken,
      this.zmgProxy,
      this.prefs = const [],
      this.attrs = const [],
      this.twoFactorAuthRequired,
      this.trustedDevicesEnabled});

  factory AuthResponse.fromMap(Map<String, dynamic> data) => AuthResponse(
        authToken: data['authToken']?[0]['_content'],
        lifetime: int.tryParse(data['lifetime']?.toString() ?? ''),
        trustLifetime: int.tryParse(data['trustLifetime']?.toString() ?? ''),
        session: data['session'] is Map ? Session.fromMap(data['session']) : null,
        refer: data['refer'],
        skin: data['skin']?[0]['_content'],
        csrfToken: data['csrfToken']?['_content'],
        deviceId: data['deviceId']?['_content'],
        trustedToken: data['trustedToken']?['_content'],
        zmgProxy: data['zmgProxy'],
        prefs: (data['prefs']?['_attrs'] is Map)
            ? Utils.prefsFromMap(data['prefs']['_attrs'] as Map<String, dynamic>)
            : const [],
        attrs: (data['attrs']?['_attrs'] is Map)
            ? Utils.attrsFromMap(data['attrs']['_attrs'] as Map<String, dynamic>)
            : const [],
        twoFactorAuthRequired: data['twoFactorAuthRequired'],
        trustedDevicesEnabled: data['trustedDevicesEnabled'],
      );
}

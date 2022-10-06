// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/attr.dart';
import 'package:zimbra_api/src/account/type/pref.dart';
import 'package:zimbra_api/src/account/type/session.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class AuthResponse extends SoapResponse {
  /// The authorization token
  String? authToken;

  /// Life time for the authorization
  int? lifetime;

  /// trust lifetime, if a trusted token is issued
  int? trustLifetime;

  /// Session information
  Session? session;

  /// host additional SOAP requests should be directed to.
  /// Always returned, might be same as original host request was sent to.
  String? refer;

  /// if requestedSkin specified, the name of the skin to use Always returned,
  /// might be same as original host request was sent to.
  String? skin;

  /// if client is CSRF token enabled, the CSRF token Returned only when client says it is CSRF enabled.
  String? csrfToken;

  /// random secure device ID generated for the requesting device
  String? deviceId;

  /// trusted device token
  String? trustedToken;

  /// indicates whether the authentication account acts as a "Proxy" to a Zimbra account on another system.
  bool? zmgProxy;

  final List<Pref> prefs = <Pref>[];

  final List<Attr> attrs = <Attr>[];

  bool? twoFactorAuthRequired;

  bool? trustedDevicesEnabled;

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
      this.twoFactorAuthRequired,
      this.trustedDevicesEnabled});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final response = AuthResponse(
        authToken: json['authToken'] != null ? json['authToken']['_content'] : null,
        lifetime: json['lifetime'] != null ? json['lifetime']['_content'] : null,
        trustLifetime: json['trustLifetime'] != null ? json['trustLifetime']['_content'] : null,
        session: json['session'] != null ? Session.fromJson(json['session']) : null,
        refer: json['refer'] != null ? json['refer']['_content'] : null,
        skin: json['skin'] != null ? json['skin']['_content'] : null,
        csrfToken: json['csrfToken'] != null ? json['csrfToken']['_content'] : null,
        deviceId: json['deviceId'] != null ? json['deviceId']['_content'] : null,
        trustedToken: json['trustedToken'] != null ? json['trustedToken']['_content'] : null,
        zmgProxy: json['zmgProxy'],
        twoFactorAuthRequired: json['twoFactorAuthRequired'] != null ? json['twoFactorAuthRequired']['_content'] : null,
        trustedDevicesEnabled:
            json['trustedDevicesEnabled'] != null ? json['trustedDevicesEnabled']['_content'] : null);

    if (json['prefs'] != null && json['prefs'] is Iterable) {
      final prefs = json['prefs']['pref'] as Iterable;
      for (final pref in prefs) {
        response.prefs.add(Pref.fromJson(pref));
      }
    }

    if (json['attrs'] != null && json['attrs'] is Iterable) {
      final attrs = json['attrs']['attr'] as Iterable;
      for (final attr in attrs) {
        response.attrs.add(Attr.fromJson(attr));
      }
    }

    return response;
  }
}

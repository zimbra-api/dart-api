// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/attr.dart';
import 'package:zimbra_api/src/account/type/pref.dart';
import 'package:zimbra_api/src/account/type/session.dart';
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

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        authToken: json['authToken']?['_content'],
        lifetime: json['lifetime']?['_content'],
        trustLifetime: json['trustLifetime']?['_content'],
        session: json['session'] is Map ? Session.fromJson(json['session']) : null,
        refer: json['refer']?['_content'],
        skin: json['skin']?['_content'],
        csrfToken: json['csrfToken']?['_content'],
        deviceId: json['deviceId']?['_content'],
        trustedToken: json['trustedToken']?['_content'],
        zmgProxy: json['zmgProxy'],
        prefs: (json['prefs']?['pref'] is Iterable)
            ? List.from((json['prefs']['pref'] as Iterable).map<Pref>((pref) => Pref.fromJson(pref)))
            : [],
        attrs: (json['attrs']?['attr'] is Iterable)
            ? List.from((json['attrs']['attr'] as Iterable).map<Attr>((attr) => Attr.fromJson(attr)))
            : [],
        twoFactorAuthRequired: json['twoFactorAuthRequired']?['_content'],
        trustedDevicesEnabled: json['trustedDevicesEnabled']?['_content'],
      );
}

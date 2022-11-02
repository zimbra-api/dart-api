// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/attr.dart';
import 'package:zimbra_api/src/account/type/auth_token.dart';
import 'package:zimbra_api/src/account/type/pre_auth.dart';
import 'package:zimbra_api/src/account/type/pref.dart';
import 'package:zimbra_api/src/common/type/account_selector.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'auth_body.dart';
import 'auth_envelope.dart';

/// Authenticate for an account
/// when specifying an account, one of <password> or <preauth> or <recoveryCode> must be specified. See preauth.txt for a discussion of preauth.
/// An authToken can be passed instead of account/password/preauth to validate an existing auth token.
/// If {verifyAccount}="1", <account> is required and the account in the auth token is compared to the named account.
/// Mismatch results in auth failure.
/// An external app that relies on ZCS for user identification can use this to test if the auth token provided by the user belongs to that user.
/// If {verifyAccount}="0" (default), only the auth token is verified and any <account> element specified is ignored.
class AuthRequest extends SoapRequest {
  /// Controls whether the auth token cookie in the response should be persisted when the browser exits.
  /// - 0: (default) the cookie will be deleted when the Web browser exits.
  /// - 1: The "Expires" attribute of the cookie will be set per rfc6265.
  final bool? persistAuthTokenCookie;

  /// Controls whether the client supports CSRF token
  /// - 0: (default) Client does not support CSRF token
  /// - 1: The client supports CSRF token.
  final bool? csrfSupported;

  /// Specifies the account to authenticate against
  final AccountSelector? account;

  /// Password to use in conjunction with an account
  final String? password;

  /// RecoveryCode to use in conjunction with an account in case of forgot password flow.
  final String? recoveryCode;

  /// The preauth
  final PreAuth? preauth;

  /// An authToken can be passed instead of account/password/preauth to validate an existing auth token.
  final AuthToken? authToken;

  /// JWT auth token
  final String? jwtToken;

  /// If specified (in conjunction with by="name"),
  /// virtual-host is used to determine the domain of the account name,
  /// if it does not include a domain component.
  final String? virtualHost;

  /// Requested preference settings.
  final List<Pref> prefs;

  /// Requested attribute settings.
  /// Only attributes that are allowed to be returned by GetInfo will be returned by this call
  final List<Attr> attrs;

  /// The requestedSkin. If specified the name of the skin requested by the client.
  final String? requestedSkin;

  /// The TOTP code used for two-factor authentication
  final String? twoFactorCode;

  /// Whether the client represents a trusted device
  final bool? deviceTrusted;

  /// Whether the client represents a trusted device
  final String? trustedDeviceToken;

  /// Unique device identifier; used to verify trusted mobile devices
  final String? deviceId;

  final bool? generateDeviceId;

  /// type of token to be returned, it can be auth or jwt
  final String? tokenType;

  /// if true SameSite=Strict cookie will not be added in AuthToken
  final bool? ignoreSameSite;

  AuthRequest(
      {this.persistAuthTokenCookie,
      this.csrfSupported,
      this.account,
      this.password,
      this.recoveryCode,
      this.preauth,
      this.authToken,
      this.jwtToken,
      this.virtualHost,
      this.requestedSkin,
      this.twoFactorCode,
      this.deviceTrusted,
      this.trustedDeviceToken,
      this.deviceId,
      this.generateDeviceId,
      this.tokenType,
      this.ignoreSameSite,
      this.prefs = const [],
      this.attrs = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => AuthEnvelope(AuthBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        if (persistAuthTokenCookie != null) 'persistAuthTokenCookie': persistAuthTokenCookie,
        if (csrfSupported != null) 'csrfTokenSecured': csrfSupported,
        if (account != null) 'account': account!.toJson(),
        if (password != null) 'password': {'_content': password},
        if (recoveryCode != null) 'recoveryCode': {'_content': recoveryCode},
        if (preauth != null) 'preauth': preauth!.toJson(),
        if (authToken != null) 'authToken': authToken!.toJson(),
        if (jwtToken != null) 'jwtToken': {'_content': jwtToken},
        if (virtualHost != null) 'virtualHost': {'_content': virtualHost},
        if (prefs.isNotEmpty) 'prefs': {'pref': prefs.map((pref) => pref.toJson()).toList()},
        if (attrs.isNotEmpty) 'attrs': {'attr': attrs.map((attr) => attr.toJson()).toList()},
        if (requestedSkin != null) 'requestedSkin': {'_content': requestedSkin},
        if (twoFactorCode != null) 'twoFactorCode': {'_content': twoFactorCode},
        if (deviceTrusted != null) 'deviceTrusted': deviceTrusted,
        if (trustedDeviceToken != null) 'trustedToken': {'_content': trustedDeviceToken},
        if (deviceId != null) 'deviceId': {'_content': deviceId},
        if (generateDeviceId != null) 'generateDeviceId': generateDeviceId,
        if (tokenType != null) 'tokenType': tokenType,
        if (ignoreSameSite != null) 'ignoreSameSite': ignoreSameSite,
      };
}

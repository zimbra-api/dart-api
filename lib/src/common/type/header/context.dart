// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/auth_token_control.dart';

import 'account_info.dart';
import 'change_info.dart';
import 'format_info.dart';
import 'notify_info.dart';
import 'session_info.dart';
import 'user_agent_info.dart';

class Context {
  final int? hopCount;

  final String? authToken;

  final SessionInfo? session;

  final SessionInfo? legacySessionId;

  final String? noSession;

  final AccountInfo? account;

  final ChangeInfo? change;

  final String? targetServer;

  final UserAgentInfo? userAgent;

  final AuthTokenControl? authTokenControl;

  final FormatInfo? format;

  final NotifyInfo? notify;

  final String? noNotify;

  final String? noQualify;

  final String? via;

  final String? soapRequestId;

  final String? csrfToken;

  Context(
      {this.hopCount,
      this.authToken,
      this.session,
      this.legacySessionId,
      this.noSession,
      this.account,
      this.change,
      this.targetServer,
      this.userAgent,
      this.authTokenControl,
      this.format,
      this.notify,
      this.noNotify,
      this.noQualify,
      this.via,
      this.soapRequestId,
      this.csrfToken});

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        hopCount: json['hops'],
        authToken: json['authToken'],
        session: json['session'] is Map ? SessionInfo.fromJson(json['session']) : null,
        legacySessionId: json['sessionId'] is Map ? SessionInfo.fromJson(json['sessionId']) : null,
        noSession: json['nosession']?['_content'],
        account: json['account'] is Map ? AccountInfo.fromJson(json['account']) : null,
        change: json['change'] is Map ? ChangeInfo.fromJson(json['change']) : null,
        targetServer: json['targetServer']?['_content'],
        userAgent: json['userAgent'] is Map ? UserAgentInfo.fromJson(json['userAgent']) : null,
        authTokenControl: json['authTokenControl'] != null ? AuthTokenControl.fromJson(json['authTokenControl']) : null,
        format: json['format'] is Map ? FormatInfo.fromJson(json['format']) : null,
        notify: json['notify'] is Map ? NotifyInfo.fromJson(json['notify']) : null,
        noNotify: json['nonotify']?['_content'],
        noQualify: json['noqualify']?['_content'],
        via: json['via']?['_content'],
        soapRequestId: json['soapId']?['_content'],
        csrfToken: json['csrfToken']?['_content'],
      );

  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbra',
        if (hopCount != null) 'hops': hopCount,
        if (authToken != null) 'authToken': {'_content': authToken},
        if (session != null) 'session': session!.toJson(),
        if (legacySessionId != null) 'sessionId': legacySessionId!.toJson(),
        if (noSession != null) 'nosession': {'_content': noSession},
        if (account != null) 'account': account!.toJson(),
        if (change != null) 'change': change!.toJson(),
        if (targetServer != null) 'targetServer': {'_content': targetServer},
        if (userAgent != null) 'userAgent': userAgent!.toJson(),
        if (authTokenControl != null) 'authTokenControl': authTokenControl!.toJson(),
        if (format != null) 'format': format!.toJson(),
        if (notify != null) 'notify': notify!.toJson(),
        if (noNotify != null) 'nonotify': {'_content': noNotify},
        if (noQualify != null) 'noqualify': {'_content': noQualify},
        if (via != null) 'via': {'_content': via},
        if (soapRequestId != null) 'soapId': {'_content': soapRequestId},
        if (csrfToken != null) 'csrfToken': {'_content': csrfToken},
      };
}

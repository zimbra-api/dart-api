// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../auth_token_control.dart';
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

  const Context({
    this.hopCount,
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
    this.csrfToken,
  });

  factory Context.fromMap(Map<String, dynamic> data) => Context(
        hopCount: int.tryParse(data['hops']?.toString() ?? ''),
        authToken: data['authToken'],
        session: data['session'] is Map ? SessionInfo.fromMap(data['session']) : null,
        legacySessionId: data['sessionId'] is Map ? SessionInfo.fromMap(data['sessionId']) : null,
        noSession: data['nosession']?['_content'],
        account: data['account'] is Map ? AccountInfo.fromMap(data['account']) : null,
        change: data['change'] is Map ? ChangeInfo.fromMap(data['change']) : null,
        targetServer: data['targetServer']?['_content'],
        userAgent: data['userAgent'] is Map ? UserAgentInfo.fromMap(data['userAgent']) : null,
        authTokenControl: data['authTokenControl'] != null ? AuthTokenControl.fromMap(data['authTokenControl']) : null,
        format: data['format'] is Map ? FormatInfo.fromMap(data['format']) : null,
        notify: data['notify'] is Map ? NotifyInfo.fromMap(data['notify']) : null,
        noNotify: data['nonotify']?['_content'],
        noQualify: data['noqualify']?['_content'],
        via: data['via']?['_content'],
        soapRequestId: data['soapId']?['_content'],
        csrfToken: data['csrfToken']?['_content'],
      );

  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbra',
        if (hopCount != null) 'hops': hopCount,
        if (authToken != null) 'authToken': {'_content': authToken},
        if (session != null) 'session': session!.toMap(),
        if (legacySessionId != null) 'sessionId': legacySessionId!.toMap(),
        if (noSession != null) 'nosession': {'_content': noSession},
        if (account != null) 'account': account!.toMap(),
        if (change != null) 'change': change!.toMap(),
        if (targetServer != null) 'targetServer': {'_content': targetServer},
        if (userAgent != null) 'userAgent': userAgent!.toMap(),
        if (authTokenControl != null) 'authTokenControl': authTokenControl!.toMap(),
        if (format != null) 'format': format!.toMap(),
        if (notify != null) 'notify': notify!.toMap(),
        if (noNotify != null) 'nonotify': {'_content': noNotify},
        if (noQualify != null) 'noqualify': {'_content': noQualify},
        if (via != null) 'via': {'_content': via},
        if (soapRequestId != null) 'soapId': {'_content': soapRequestId},
        if (csrfToken != null) 'csrfToken': {'_content': csrfToken},
      };
}

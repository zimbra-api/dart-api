// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/connection_type.dart';

import 'mail_data_source.dart';

class MailPop3DataSource extends MailDataSource {
  /// Specifies whether imported POP3 messages should be left on the server or deleted.
  final bool? leaveOnServer;

  MailPop3DataSource(
      {super.id,
      super.name,
      super.folderId,
      super.isEnabled,
      super.importOnly,
      super.host,
      super.port,
      super.connectionType,
      super.username,
      super.password,
      super.pollingInterval,
      super.emailAddress,
      super.smtpEnabled,
      super.smtpHost,
      super.smtpPort,
      super.smtpConnectionType,
      super.smtpAuthRequired,
      super.smtpUsername,
      super.smtpPassword,
      super.useAddressForForwardReply,
      super.defaultSignature,
      super.forwardReplySignature,
      super.fromDisplay,
      super.replyToAddress,
      super.replyToDisplay,
      super.importClass,
      super.failingSince,
      super.lastError,
      super.refreshToken,
      super.refreshTokenUrl,
      this.leaveOnServer,
      super.attributes = const []});

  factory MailPop3DataSource.fromJson(Map<String, dynamic> json) => MailPop3DataSource(
        id: json['id'],
        name: json['name'],
        folderId: json['l'],
        isEnabled: json['isEnabled'],
        importOnly: json['importOnly'],
        host: json['host'],
        port: json['port'],
        connectionType: ConnectionType.values.firstWhere(
          (item) => item.name == json['connectionType'],
          orElse: () => ConnectionType.clearText,
        ),
        username: json['username'],
        password: json['password'],
        pollingInterval: json['pollingInterval'],
        emailAddress: json['emailAddress'],
        smtpEnabled: json['smtpEnabled'],
        smtpHost: json['smtpHost'],
        smtpPort: json['smtpPort'],
        smtpConnectionType: ConnectionType.values.firstWhere(
          (item) => item.name == json['smtpConnectionType'],
          orElse: () => ConnectionType.clearText,
        ),
        smtpAuthRequired: json['smtpAuthRequired'],
        smtpUsername: json['smtpUsername'],
        smtpPassword: json['smtpPassword'],
        useAddressForForwardReply: json['useAddressForForwardReply'],
        defaultSignature: json['defaultSignature'],
        forwardReplySignature: json['forwardReplySignature'],
        fromDisplay: json['fromDisplay'],
        replyToAddress: json['replyToAddress'],
        replyToDisplay: json['replyToDisplay'],
        importClass: json['importClass'],
        failingSince: json['failingSince'],
        lastError: json['lastError']?['_content'],
        refreshToken: json['refreshToken'],
        refreshTokenUrl: json['refreshTokenUrl'],
        leaveOnServer: json['leaveOnServer'],
        attributes: (json['a'] is Iterable) ? List.from((json['a'] as Iterable).map((a) => a['_content'])) : [],
      );

  @override
  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (folderId != null) 'l': folderId,
        if (isEnabled != null) 'isEnabled': isEnabled,
        if (importOnly != null) 'importOnly': importOnly,
        if (host != null) 'host': host,
        if (port != null) 'port': port,
        if (connectionType != null) 'connectionType': connectionType!.name,
        if (username != null) 'username': username,
        if (password != null) 'password': password,
        if (pollingInterval != null) 'pollingInterval': pollingInterval,
        if (emailAddress != null) 'emailAddress': emailAddress,
        if (smtpEnabled != null) 'smtpEnabled': smtpEnabled,
        if (smtpHost != null) 'smtpHost': smtpHost,
        if (smtpPort != null) 'smtpPort': smtpPort,
        if (smtpConnectionType != null) 'smtpConnectionType': smtpConnectionType!.name,
        if (smtpAuthRequired != null) 'smtpAuthRequired': smtpAuthRequired,
        if (smtpUsername != null) 'smtpUsername': smtpUsername,
        if (smtpPassword != null) 'smtpPassword': smtpPassword,
        if (useAddressForForwardReply != null) 'useAddressForForwardReply': useAddressForForwardReply,
        if (defaultSignature != null) 'defaultSignature': defaultSignature,
        if (forwardReplySignature != null) 'forwardReplySignature': forwardReplySignature,
        if (fromDisplay != null) 'fromDisplay': fromDisplay,
        if (replyToAddress != null) 'replyToAddress': replyToAddress,
        if (replyToDisplay != null) 'replyToDisplay': replyToDisplay,
        if (importClass != null) 'importClass': importClass,
        if (failingSince != null) 'failingSince': failingSince,
        if (lastError != null) 'lastError': {'_content': lastError},
        if (refreshToken != null) 'refreshToken': refreshToken,
        if (refreshTokenUrl != null) 'refreshTokenUrl': refreshTokenUrl,
        if (leaveOnServer != null) 'leaveOnServer': leaveOnServer,
        if (attributes.isNotEmpty) 'a': attributes.map((a) => {'_content': a}),
      };
}

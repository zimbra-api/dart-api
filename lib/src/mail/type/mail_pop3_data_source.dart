// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/connection_type.dart';
import 'mail_data_source.dart';

class MailPop3DataSource extends MailDataSource {
  /// Specifies whether imported POP3 messages should be left on the server or deleted.
  final bool? leaveOnServer;

  const MailPop3DataSource({
    super.id,
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
    super.attributes = const [],
  });

  factory MailPop3DataSource.fromMap(
    Map<String, dynamic> data,
  ) =>
      MailPop3DataSource(
        id: data['id'],
        name: data['name'],
        folderId: data['l'],
        isEnabled: data['isEnabled'],
        importOnly: data['importOnly'],
        host: data['host'],
        port: int.tryParse(data['port']?.toString() ?? ''),
        connectionType: ConnectionType.values.firstWhere(
          (type) => type.name == data['connectionType'],
          orElse: () => ConnectionType.clearText,
        ),
        username: data['username'],
        password: data['password'],
        pollingInterval: data['pollingInterval'],
        emailAddress: data['emailAddress'],
        smtpEnabled: data['smtpEnabled'],
        smtpHost: data['smtpHost'],
        smtpPort: int.tryParse(data['smtpPort']?.toString() ?? ''),
        smtpConnectionType: ConnectionType.values.firstWhere(
          (type) => type.name == data['smtpConnectionType'],
          orElse: () => ConnectionType.clearText,
        ),
        smtpAuthRequired: data['smtpAuthRequired'],
        smtpUsername: data['smtpUsername'],
        smtpPassword: data['smtpPassword'],
        useAddressForForwardReply: data['useAddressForForwardReply'],
        defaultSignature: data['defaultSignature'],
        forwardReplySignature: data['forwardReplySignature'],
        fromDisplay: data['fromDisplay'],
        replyToAddress: data['replyToAddress'],
        replyToDisplay: data['replyToDisplay'],
        importClass: data['importClass'],
        failingSince: int.tryParse(data['failingSince']?.toString() ?? ''),
        lastError: data['lastError']?['_content'],
        refreshToken: data['refreshToken'],
        refreshTokenUrl: data['refreshTokenUrl'],
        leaveOnServer: data['leaveOnServer'],
        attributes: (data['a'] is Iterable)
            ? (data['a'] as Iterable)
                .map<String>(
                  (a) => a['_content'],
                )
                .toList(growable: false)
            : const [],
      );

  @override
  Map<String, dynamic> toMap() => {
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
        if (attributes.isNotEmpty)
          'a': attributes
              .map(
                (a) => {'_content': a},
              )
              .toList(growable: false),
      };
}

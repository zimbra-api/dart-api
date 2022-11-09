// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/connection_type.dart';

import 'mail_data_source.dart';

class MailImapDataSource extends MailDataSource {
  /// oauthToken for data source
  final String? oauthToken;

  /// client Id for refreshing data source oauth token
  final String? clientId;

  /// client secret for refreshing data source oauth token
  final String? clientSecret;

  /// bool field for client to denote if it wants to test the data source before creating
  final bool? test;

  MailImapDataSource(
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
      this.oauthToken,
      this.clientId,
      this.clientSecret,
      this.test,
      super.attributes = const []});

  factory MailImapDataSource.fromMap(Map<String, dynamic> data) => MailImapDataSource(
      id: data['id'],
      name: data['name'],
      folderId: data['l'],
      isEnabled: data['isEnabled'],
      importOnly: data['importOnly'],
      host: data['host'],
      port: int.tryParse(data['port']?.toString() ?? ''),
      connectionType: ConnectionType.values.firstWhere(
        (item) => item.name == data['connectionType'],
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
        (item) => item.name == data['smtpConnectionType'],
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
      oauthToken: data['oauthToken'],
      clientId: data['clientId'],
      clientSecret: data['clientSecret'],
      test: data['test'],
      attributes: (data['a'] is Iterable) ? List.from((data['a'] as Iterable).map((a) => a['_content'])) : []);

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
        if (oauthToken != null) 'oauthToken': oauthToken,
        if (clientId != null) 'clientId': clientId,
        if (clientSecret != null) 'clientSecret': clientSecret,
        if (test != null) 'test': test,
        if (attributes.isNotEmpty) 'a': attributes.map((a) => {'_content': a}),
      };
}

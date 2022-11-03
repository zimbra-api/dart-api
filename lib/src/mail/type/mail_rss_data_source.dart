// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/connection_type.dart';

import 'mail_data_source.dart';

class MailRssDataSource extends MailDataSource {
  MailRssDataSource(
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
      super.attributes = const []});

  factory MailRssDataSource.fromMap(Map<String, dynamic> data) => MailRssDataSource(
      id: data['id'],
      name: data['name'],
      folderId: data['l'],
      isEnabled: data['isEnabled'],
      importOnly: data['importOnly'],
      host: data['host'],
      port: data['port'],
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
      smtpPort: data['smtpPort'],
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
      failingSince: data['failingSince'],
      lastError: data['lastError']?['_content'],
      refreshToken: data['refreshToken'],
      refreshTokenUrl: data['refreshTokenUrl'],
      attributes: (data['a'] is Iterable) ? List.from((data['a'] as Iterable).map((a) => a['_content'])) : []);
}

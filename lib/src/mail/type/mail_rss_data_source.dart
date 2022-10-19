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

  factory MailRssDataSource.fromJson(Map<String, dynamic> json) => MailRssDataSource(
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
      attributes: (json['a'] is Iterable) ? List.from((json['a'] as Iterable).map((a) => a['_content'])) : []);
}

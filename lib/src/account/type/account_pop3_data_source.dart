// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with super source code.

import 'package:zimbra_api/src/common/enum/connection_type.dart';

import 'account_data_source.dart';

class AccountPop3DataSource extends AccountDataSource {
  /// Specifies whether imported POP3 messages should be left on the server or deleted.
  final bool? leaveOnServer;

  AccountPop3DataSource(
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
      super.useAddressForForwardReply,
      super.defaultSignature,
      super.forwardReplySignature,
      super.fromDisplay,
      super.replyToAddress,
      super.replyToDisplay,
      super.importClass,
      super.failingSince,
      super.lastError,
      super.attributes = const [],
      super.refreshToken,
      super.refreshTokenUrl,
      this.leaveOnServer});

  factory AccountPop3DataSource.fromJson(Map<String, dynamic> json) => AccountPop3DataSource(
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
        useAddressForForwardReply: json['useAddressForForwardReply'],
        defaultSignature: json['defaultSignature'],
        forwardReplySignature: json['forwardReplySignature'],
        fromDisplay: json['fromDisplay'],
        replyToAddress: json['replyToAddress'],
        replyToDisplay: json['replyToDisplay'],
        importClass: json['importClass'],
        failingSince: json['failingSince'],
        lastError: json['lastError'] != null ? json['lastError']['_content'] : null,
        attributes: (json['a'] is Iterable) ? List.from((json['a'] as Iterable).map((a) => a['_content'])) : [],
        refreshToken: json['refreshToken'],
        refreshTokenUrl: json['refreshTokenUrl'],
        leaveOnServer: json['leaveOnServer'],
      );

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    if (leaveOnServer != null) json['leaveOnServer'] = leaveOnServer;
    return json;
  }
}

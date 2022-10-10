// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with super source code.

import 'package:zimbra_api/src/common/enum/connection_type.dart';

import 'account_data_source.dart';

class AccountCaldavDataSource extends AccountDataSource {
  AccountCaldavDataSource(
      {super.id,
      super.name,
      super.folderId,
      super.enabled,
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
      super.refreshTokenUrl});

  factory AccountCaldavDataSource.fromJson(Map<String, dynamic> json) {
    final connectionType = ConnectionType.values.firstWhere(
      (item) => item.name == json['connectionType'],
      orElse: () => ConnectionType.clearText,
    );

    final attributes = <String>[];
    if (json['a'] != null && json['a'] is Iterable) {
      final attrs = json['a'] as Iterable;
      for (final a in attrs) {
        attributes.add(a['_content']);
      }
    }

    return AccountCaldavDataSource(
        id: json['id'],
        name: json['name'],
        folderId: json['l'],
        enabled: json['isEnabled'],
        importOnly: json['importOnly'],
        host: json['host'],
        port: json['port'],
        connectionType: connectionType,
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
        attributes: attributes,
        refreshToken: json['refreshToken'],
        refreshTokenUrl: json['refreshTokenUrl']);
  }
}

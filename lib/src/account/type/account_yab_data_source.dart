// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with super source code.

import 'package:zimbra_api/src/common/enum/connection_type.dart';

import 'account_data_source.dart';

class AccountYabDataSource extends AccountDataSource {
  AccountYabDataSource(
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
      super.refreshTokenUrl});

  factory AccountYabDataSource.fromMap(Map<String, dynamic> data) => AccountYabDataSource(
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
        useAddressForForwardReply: data['useAddressForForwardReply'],
        defaultSignature: data['defaultSignature'],
        forwardReplySignature: data['forwardReplySignature'],
        fromDisplay: data['fromDisplay'],
        replyToAddress: data['replyToAddress'],
        replyToDisplay: data['replyToDisplay'],
        importClass: data['importClass'],
        failingSince: int.tryParse(data['failingSince']?.toString() ?? ''),
        lastError: data['lastError']?['_content'],
        attributes: (data['a'] is Iterable)
            ? (data['a'] as Iterable).map<String>((a) => a['_content']).toList(growable: false)
            : const [],
        refreshToken: data['refreshToken'],
        refreshTokenUrl: data['refreshTokenUrl'],
      );
}

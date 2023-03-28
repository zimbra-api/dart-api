// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with super source code.

import '../../common/enum/connection_type.dart';
import 'account_data_source.dart';

class AccountPop3DataSource extends AccountDataSource {
  /// Specifies whether imported POP3 messages should be left on the server or deleted.
  final bool? leaveOnServer;

  const AccountPop3DataSource({
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
    this.leaveOnServer,
  });

  factory AccountPop3DataSource.fromMap(
    Map<String, dynamic> data,
  ) =>
      AccountPop3DataSource(
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
            ? (data['a'] as Iterable)
                .map<String>(
                  (a) => a['_content'],
                )
                .toList(growable: false)
            : const [],
        refreshToken: data['refreshToken'],
        refreshTokenUrl: data['refreshTokenUrl'],
        leaveOnServer: data['leaveOnServer'],
      );

  @override
  Map<String, dynamic> toMap() {
    final data = super.toMap();
    if (leaveOnServer != null) data['leaveOnServer'] = leaveOnServer;
    return data;
  }
}

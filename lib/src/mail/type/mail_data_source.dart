// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/connection_type.dart';

class MailDataSource {
  /// Unique ID for data source
  final String? id;

  /// Name for data source
  final String? name;

  /// Folder ID for data source
  final String? folderId;

  /// Flag whether or not the data source is enabled
  final bool? isEnabled;

  /// indicates that this datasource is used for one way (incoming) import versus two-way sync
  final bool? importOnly;

  /// Name of server. e.g. 'imap.myisp.com'
  final String? host;

  /// Port number of server. e.g. '143'
  final int? port;

  /// Which security layer to use for connection (cleartext, ssl, tls, or tls if available).
  /// If not set on data source, fallback to the id on global config.
  final ConnectionType? connectionType;

  /// Login string on data-source-server, for example a user name
  final String? username;

  /// Login password for data source
  final String? password;

  /// Polling interval. For instance '10m'
  final String? pollingInterval;

  /// Email address for the data-source
  final String? emailAddress;

  /// Whether sending outbound mail using external SMTP server is enabled in this data source.
  final bool? smtpEnabled;

  /// Name of SMTP server. e.g. 'smtp.myisp.com'
  final String? smtpHost;

  /// Port number of SMTP server. e.g. '465'
  final int? smtpPort;

  /// Which security layer to use for connecting to SMTP host associated with this data source.
  final ConnectionType? smtpConnectionType;

  /// Whether SMTP server associated with this data source requires authentication.
  final bool? smtpAuthRequired;

  /// Login username for SMTP server
  final String? smtpUsername;

  /// Login password for SMTP server
  final String? smtpPassword;

  /// When forwarding or replying to messages sent to this data source, this flags whether
  /// or not to use the email address of the data source for the from address and the designated signature/replyTo
  /// of the data source for the outgoing message.
  final bool? useAddressForForwardReply;

  /// ID for default signature
  final String? defaultSignature;

  /// Forward / Reply Signature ID for data source
  final String? forwardReplySignature;

  /// Personal part of email address to put in the from header
  final String? fromDisplay;

  /// Email address to put in the reply-to header
  final String? replyToAddress;

  ///Personal part of Email address to put in the reply-to header
  final String? replyToDisplay;

  /// Data import class used bt this data source
  final String? importClass;

  /// Failing Since
  final int? failingSince;

  /// Last Error
  final String? lastError;

  /// Refresh token for refreshing data source oauth token
  final String? refreshToken;

  /// refreshTokenUrl for refreshing data source oauth token
  final String? refreshTokenUrl;

  /// Properties for the data source
  final List<String> attributes;

  const MailDataSource({
    this.id,
    this.name,
    this.folderId,
    this.isEnabled,
    this.importOnly,
    this.host,
    this.port,
    this.connectionType,
    this.username,
    this.password,
    this.pollingInterval,
    this.emailAddress,
    this.smtpEnabled,
    this.smtpHost,
    this.smtpPort,
    this.smtpConnectionType,
    this.smtpAuthRequired,
    this.smtpUsername,
    this.smtpPassword,
    this.useAddressForForwardReply,
    this.defaultSignature,
    this.forwardReplySignature,
    this.fromDisplay,
    this.replyToAddress,
    this.replyToDisplay,
    this.importClass,
    this.failingSince,
    this.lastError,
    this.refreshToken,
    this.refreshTokenUrl,
    this.attributes = const [],
  });

  factory MailDataSource.fromMap(Map<String, dynamic> data) => MailDataSource(
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
        attributes: (data['a'] is Iterable)
            ? (data['a'] as Iterable)
                .map<String>(
                  (a) => a['_content'],
                )
                .toList(growable: false)
            : const [],
      );

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
        if (smtpConnectionType != null)
          'smtpConnectionType': smtpConnectionType!.name,
        if (smtpAuthRequired != null) 'smtpAuthRequired': smtpAuthRequired,
        if (smtpUsername != null) 'smtpUsername': smtpUsername,
        if (smtpPassword != null) 'smtpPassword': smtpPassword,
        if (useAddressForForwardReply != null)
          'useAddressForForwardReply': useAddressForForwardReply,
        if (defaultSignature != null) 'defaultSignature': defaultSignature,
        if (forwardReplySignature != null)
          'forwardReplySignature': forwardReplySignature,
        if (fromDisplay != null) 'fromDisplay': fromDisplay,
        if (replyToAddress != null) 'replyToAddress': replyToAddress,
        if (replyToDisplay != null) 'replyToDisplay': replyToDisplay,
        if (importClass != null) 'importClass': importClass,
        if (failingSince != null) 'failingSince': failingSince,
        if (lastError != null) 'lastError': {'_content': lastError},
        if (refreshToken != null) 'refreshToken': refreshToken,
        if (refreshTokenUrl != null) 'refreshTokenUrl': refreshTokenUrl,
        if (attributes.isNotEmpty)
          'a': attributes
              .map(
                (a) => {'_content': a},
              )
              .toList(growable: false),
      };
}

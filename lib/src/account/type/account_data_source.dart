// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/connection_type.dart';

class AccountDataSource {
  /// Unique ID for data source
  final String? id;

  /// Name for data source
  final String? name;

  /// Folder ID for data source
  final String? folderId;

  /// Flag whether or not the data source is enabled
  final bool? enabled;

  /// indicates that this datasource is used for one way (incoming) import versus two-way sync
  final bool? importOnly;

  /// Name of server. e.g. "imap.myisp.com"
  final String? host;

  /// Port number of server. e.g. "143"
  final int? port;

  /// Which security layer to use for connection (cleartext, ssl, tls, or tls if available).
  /// If not set on data source, fallback to the id on global config.
  final ConnectionType? connectionType;

  /// Login string on data-source-server, for example a user name
  final String? username;

  /// Login password for data source
  final String? password;

  /// Polling interval.  For instance "10m"
  final String? pollingInterval;

  /// Email address for the data-source
  final String? emailAddress;

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

  /// Personal part of Email address to put in the reply-to header
  final String? replyToDisplay;

  /// Data import class used bt this data source
  final String? importClass;

  /// Failing Since
  final int? failingSince;

  /// Last Error
  final String? lastError;

  /// Properties for the data source
  final List<String> attributes;

  /// token for refreshing data source oauth token
  final String? refreshToken;

  /// refreshTokenUrl for refreshing data source oauth token
  final String? refreshTokenUrl;

  AccountDataSource(
      {this.id,
      this.name,
      this.folderId,
      this.enabled,
      this.importOnly,
      this.host,
      this.port,
      this.connectionType,
      this.username,
      this.password,
      this.pollingInterval,
      this.emailAddress,
      this.useAddressForForwardReply,
      this.defaultSignature,
      this.forwardReplySignature,
      this.fromDisplay,
      this.replyToAddress,
      this.replyToDisplay,
      this.importClass,
      this.failingSince,
      this.lastError,
      this.attributes = const <String>[],
      this.refreshToken,
      this.refreshTokenUrl});

  factory AccountDataSource.fromJson(Map<String, dynamic> json) {
    final connectionType = ConnectionType.values.firstWhere(
      (item) => item.name == json['connectionType'],
      orElse: () => ConnectionType.clearText,
    );

    var ds = AccountDataSource(
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
        refreshToken: json['refreshToken'],
        refreshTokenUrl: json['refreshTokenUrl']);

    if (json['a'] != null && json['a'] is Iterable) {
      final attributes = json['a'] as Iterable;
      for (final a in attributes) {
        ds.attributes.add(a['_content']);
      }
    }

    return ds;
  }

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (folderId != null) 'l': folderId,
        if (enabled != null) 'isEnabled': enabled,
        if (importOnly != null) 'importOnly': importOnly,
        if (host != null) 'host': host,
        if (port != null) 'port': port,
        if (connectionType != null) 'connectionType': connectionType!.name,
        if (username != null) 'username': username,
        if (password != null) 'password': password,
        if (pollingInterval != null) 'pollingInterval': pollingInterval,
        if (emailAddress != null) 'emailAddress': emailAddress,
        if (useAddressForForwardReply != null) 'useAddressForForwardReply': useAddressForForwardReply,
        if (defaultSignature != null) 'defaultSignature': defaultSignature,
        if (forwardReplySignature != null) 'forwardReplySignature': forwardReplySignature,
        if (fromDisplay != null) 'fromDisplay': fromDisplay,
        if (replyToAddress != null) 'replyToAddress': replyToAddress,
        if (replyToDisplay != null) 'replyToDisplay': replyToDisplay,
        if (importClass != null) 'importClass': importClass,
        if (failingSince != null) 'failingSince': failingSince,
        if (lastError != null) 'lastError': {'_content': lastError},
        if (attributes.isNotEmpty) 'a': attributes.map((a) => {'_content': a}),
        if (refreshToken != null) 'refreshToken': refreshToken,
        if (refreshTokenUrl != null) 'refreshTokenUrl': refreshTokenUrl,
      };
}

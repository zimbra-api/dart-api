// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'dart:convert';
import 'package:crypto/crypto.dart';

import '../../common/type/account_selector.dart';

class PreAuth {
  final String value;

  final int timestamp;

  final int expiresTimestamp;

  PreAuth(AccountSelector account, String preauthKey, {this.timestamp = 0, this.expiresTimestamp = 0})
      : value = computeValue(account, preauthKey, timestamp: timestamp, expiresTimestamp: expiresTimestamp);

  static String computeValue(
    AccountSelector account,
    String preauthKey, {
    int expiresTimestamp = 0,
    int timestamp = 0,
  }) {
    final hmac = Hmac(sha1, utf8.encode(preauthKey));
    final digest = hmac.convert(utf8.encode("${account.value}|${account.by.name}|$expiresTimestamp|$timestamp"));
    return digest.toString();
  }

  Map<String, dynamic> toMap() => {
        'timestamp': timestamp,
        'expires': expiresTimestamp,
        '_content': value,
      };
}

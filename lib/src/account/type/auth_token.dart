// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AuthToken {
  String value;

  int lifetime;

  bool verifyAccount;

  AuthToken(this.value, {this.lifetime = 0, this.verifyAccount = false});

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    final verifyAccount =
        (json['verifyAccount'] != null && json['verifyAccount'] is bool) ? json['verifyAccount'] as bool : false;
    return AuthToken(json['_content']?.toString() ?? '',
        lifetime: int.tryParse(json['lifetime'].toString()) ?? 0, verifyAccount: verifyAccount);
  }

  Map<String, dynamic> toJson() => {
        'lifetime': lifetime,
        'verifyAccount': verifyAccount,
        '_content': value,
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AuthToken {
  final String value;

  final int? lifetime;

  final bool? verifyAccount;

  AuthToken(this.value, {this.lifetime, this.verifyAccount});

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(json['_content'] ?? '', lifetime: json['lifetime'], verifyAccount: json['verifyAccount']);
  }

  Map<String, dynamic> toJson() => {
        '_content': value,
        if (lifetime != null) 'lifetime': lifetime,
        if (verifyAccount != null) 'verifyAccount': verifyAccount,
      };
}

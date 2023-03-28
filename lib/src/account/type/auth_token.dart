// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AuthToken {
  final String value;

  final int? lifetime;

  final bool? verifyAccount;

  const AuthToken(this.value, {this.lifetime, this.verifyAccount});

  factory AuthToken.fromMap(Map<String, dynamic> data) {
    return AuthToken(
      data['_content'] ?? '',
      lifetime: int.tryParse(data['lifetime']?.toString() ?? ''),
      verifyAccount: data['verifyAccount'],
    );
  }

  Map<String, dynamic> toMap() => {
        '_content': value,
        if (lifetime != null) 'lifetime': lifetime,
        if (verifyAccount != null) 'verifyAccount': verifyAccount,
      };
}

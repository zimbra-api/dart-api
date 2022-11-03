// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AccountZimletTarget {
  final String? value;

  AccountZimletTarget({this.value});

  factory AccountZimletTarget.fromMap(Map<String, dynamic> data) => AccountZimletTarget(value: data['_content']);

  Map<String, dynamic> toMap() => {
        if (value != null) '_content': value,
      };
}

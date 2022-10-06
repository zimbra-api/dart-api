// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AccountZimletTarget {
  final String? value;

  AccountZimletTarget({this.value});

  factory AccountZimletTarget.fromJson(Map<String, dynamic> json) => AccountZimletTarget(value: json['_content']);

  Map<String, dynamic> toJson() => {
        if (value != null) '_content': value,
      };
}

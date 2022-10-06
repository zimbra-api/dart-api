// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AccountZimletInclude {
  final String? value;

  AccountZimletInclude({this.value});

  factory AccountZimletInclude.fromJson(Map<String, dynamic> json) => AccountZimletInclude(value: json['_content']);

  Map<String, dynamic> toJson() => {
        if (value != null) '_content': value,
      };
}

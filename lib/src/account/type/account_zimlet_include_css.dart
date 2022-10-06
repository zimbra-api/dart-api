// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AccountZimletIncludeCSS {
  /// Included Cascading Style Sheet (CSS)
  final String? value;

  AccountZimletIncludeCSS({this.value});

  factory AccountZimletIncludeCSS.fromJson(Map<String, dynamic> json) =>
      AccountZimletIncludeCSS(value: json['_content']);

  Map<String, dynamic> toJson() => {
        if (value != null) '_content': value,
      };
}

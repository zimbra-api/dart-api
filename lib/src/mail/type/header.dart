// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Header information
class Header {
  /// Header name
  final String name;

  /// Header value
  final String? value;

  Header(this.name, {this.value});

  factory Header.fromJson(Map<String, dynamic> json) => Header(json['name'] ?? '', value: json['_content']);

  Map<String, dynamic> toJson() => {
        'name': name,
        if (value != null) '_content': value,
      };
}

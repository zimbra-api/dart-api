// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// License attributes
class LicenseAttr {
  /// Current valid values are "SMIME" and "VOICE"
  final String name;

  /// Value - value is "TRUE" or "FALSE"
  final String? content;

  const LicenseAttr(this.name, {this.content});

  factory LicenseAttr.fromMap(Map<String, dynamic> data) => LicenseAttr(data['name'], content: data['_content']);

  Map<String, dynamic> toMap() => {
        'name': name,
        if (content != null) '_content': content,
      };
}

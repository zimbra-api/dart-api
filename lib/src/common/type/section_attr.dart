// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class SectionAttr {
  /// Metadata section key
  final String section;

  SectionAttr({this.section = ''});

  factory SectionAttr.fromJson(Map<String, dynamic> json) => SectionAttr(section: json['section'] ?? '');

  Map<String, dynamic> toJson() => {
        'section': section,
      };
}

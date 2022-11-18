// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class SectionAttr {
  /// Metadata section key
  final String section;

  const SectionAttr({this.section = ''});

  factory SectionAttr.fromMap(Map<String, dynamic> data) => SectionAttr(section: data['section'] ?? '');

  Map<String, dynamic> toMap() => {
        'section': section,
      };
}

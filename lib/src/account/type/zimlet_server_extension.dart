// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ZimletServerExtension {
  final String? hasKeyword;

  final String? extensionClass;

  final String? regex;

  const ZimletServerExtension({this.hasKeyword, this.extensionClass, this.regex});

  factory ZimletServerExtension.fromMap(Map<String, dynamic> data) => ZimletServerExtension(
      hasKeyword: data['hasKeyword'], extensionClass: data['extensionClass'], regex: data['regex']);

  Map<String, dynamic> toMap() => {
        if (hasKeyword != null) 'hasKeyword': hasKeyword,
        if (extensionClass != null) 'extensionClass': extensionClass,
        if (regex != null) 'regex': regex,
      };
}

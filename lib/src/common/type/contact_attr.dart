// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'key_value_pair.dart';

class ContactAttr extends KeyValuePair {
  final String? part;

  final String? contentType;

  final int? size;

  final String? contentFilename;

  const ContactAttr(
    super.key, {
    super.value,
    this.part,
    this.contentType,
    this.size,
    this.contentFilename,
  });

  factory ContactAttr.fromMap(Map<String, dynamic> data) => ContactAttr(
        data['n'],
        value: data['_content'],
        part: data['part'],
        contentType: data['ct'],
        size: int.tryParse(data['s']?.toString() ?? ''),
        contentFilename: data['filename'],
      );

  @override
  Map<String, dynamic> toMap() => {
        'n': key,
        if (value != null) '_content': value,
        if (part != null) 'part': part,
        if (contentType != null) 'ct': contentType,
        if (size != null) 's': size,
        if (contentFilename != null) 'filename': contentFilename,
      };

  static List<ContactAttr> contactAttrsFromMap(Map<String, dynamic> data) {
    final attrs = <ContactAttr>[];
    for (final entry in data.entries) {
      if (entry.value is Iterable) {
        attrs.addAll(
          (entry.value as Iterable).map<ContactAttr>(
            (value) => ContactAttr(entry.key, value: value),
          ),
        );
      } else {
        attrs.add(ContactAttr(entry.key, value: entry.value));
      }
    }
    return attrs.toList(growable: false);
  }
}

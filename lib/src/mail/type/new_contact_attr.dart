// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// New contact attribute
class NewContactAttr {
  /// Attribute name
  final String name;

  /// Upload ID
  final String? attachId;

  /// Item ID. Used in combination with subpart-name
  final int? id;

  /// Subpart Name
  final String? part;

  /// Attribute data
  /// Date related attributes like "birthday" and "anniversary" SHOULD use "yyyy-MM-dd" format or,
  /// if the year isn't specified "--MM-dd" format
  final String? value;

  const NewContactAttr(this.name, {this.attachId, this.id, this.part, this.value});

  factory NewContactAttr.fromMap(Map<String, dynamic> data) => NewContactAttr(data['n'] ?? '',
      attachId: data['aid'],
      id: int.tryParse(data['id']?.toString() ?? ''),
      part: data['part'],
      value: data['_content']);

  Map<String, dynamic> toMap() => {
        'n': name,
        if (attachId != null) 'aid': attachId,
        if (id != null) 'id': id,
        if (part != null) 'part': part,
        if (value != null) '_content': value,
      };
}

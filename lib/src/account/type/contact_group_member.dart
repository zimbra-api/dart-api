// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'contact_info.dart';

class ContactGroupMember {
  // Contact group member type
  final String type;

  // Contact group member value
  final String value;

  final ContactInfo? contact;

  const ContactGroupMember({this.type = '', this.value = '', this.contact});

  factory ContactGroupMember.fromMap(Map<String, dynamic> data) => ContactGroupMember(
      type: data['type'] ?? '',
      value: data['value'] ?? '',
      contact: (data['cn'] is Map) ? ContactInfo.fromMap(data['cn']) : null);

  Map<String, dynamic> toMap() => {
        'type': type,
        'value': value,
        if (contact != null) 'cn': contact!.toMap(),
      };
}

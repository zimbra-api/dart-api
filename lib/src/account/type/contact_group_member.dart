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

  ContactGroupMember({this.type = '', this.value = '', this.contact});

  factory ContactGroupMember.fromJson(Map<String, dynamic> json) => ContactGroupMember(
      type: json['type'] ?? '',
      value: json['value'] ?? '',
      contact: (json['cn'] is Map) ? ContactInfo.fromJson(json['cn']) : null);

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
        if (contact != null) 'cn': contact!.toJson(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'contact_info.dart';

class ContactGroupMember {
  // Contact group member type
  String type;

  // Contact group member value
  String value;

  ContactInfo? contact;

  ContactGroupMember({this.type = '', this.value = '', this.contact});

  factory ContactGroupMember.fromJson(Map<String, dynamic> json) => ContactGroupMember(
      type: json['type'] ?? '',
      value: json['value'] ?? '',
      contact: json['cn'] != null ? ContactInfo.fromJson(json['cn']) : null);

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
        if (contact != null) 'cn': contact!.toJson(),
      };
}

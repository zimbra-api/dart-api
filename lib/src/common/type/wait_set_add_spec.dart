// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/interest_type.dart';

class WaitSetAddSpec {
  /// The name
  final String? name;

  /// The id
  final String? id;

  /// Last known sync token
  final String? token;

  /// Comma-separated InterestType's values. Currently:
  /// f: folders
  /// m: messages
  /// c: contacts
  /// a: appointments
  /// t: tasks
  /// d: documents
  /// all: all types (equiv to 'f,m,c,a,t,d')
  final String? interests;

  /// Comma-separated interest folder id
  final String? folderInterests;

  WaitSetAddSpec({this.name, this.id, this.token, this.interests, this.folderInterests});

  factory WaitSetAddSpec.fromJson(Map<String, dynamic> json) => WaitSetAddSpec(
      name: json['name'],
      id: json['id'],
      token: json['token'],
      interests: json['types'],
      folderInterests: json['folderInterests']);

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (id != null) 'id': id,
        if (token != null) 'token': token,
        if (interests != null)
          'types': interests!
              .split(',')
              .toSet()
              .where((type) => InterestType.values.any((element) => element.name == type))
              .join(','),
        if (folderInterests != null) 'folderInterests': folderInterests,
      };
}
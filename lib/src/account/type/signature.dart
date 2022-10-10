// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'signature_content.dart';

class Signature {
  final String? name;

  final String? id;

  final String? cid;

  /// Content of the signature
  final List<SignatureContent> contents;

  Signature({this.name, this.id, this.cid, this.contents = const []});

  factory Signature.fromJson(Map<String, dynamic> json) {
    final contents = <SignatureContent>[];
    if (json['content'] != null && json['content'] is Iterable) {
      final elements = json['content'] as Iterable;
      for (final content in elements) {
        contents.add(SignatureContent.fromJson(content));
      }
    }
    return Signature(name: json['name'], id: json['id'], cid: json['cid'], contents: contents);
  }

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (id != null) 'id': id,
        if (cid != null) 'cid': cid,
        if (contents.isNotEmpty) 'content': contents.map((content) => content.toJson()).toList(),
      };
}

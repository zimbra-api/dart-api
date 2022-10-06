// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'signature_content.dart';

class Signature {
  String? name;

  String? id;

  String? cid;

  /// Content of the signature
  final List<SignatureContent> contents;

  Signature({this.name, this.id, this.cid, this.contents = const <SignatureContent>[]});

  factory Signature.fromJson(Map<String, dynamic> json) {
    final signature = Signature(name: json['name'], id: json['id'], cid: json['cid']);

    if (json['content'] != null && json['content'] is Iterable) {
      final contents = json['content'] as Iterable;
      for (final content in contents) {
        signature.contents.add(SignatureContent.fromJson(content));
      }
    }

    return signature;
  }

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (id != null) 'id': id,
        if (cid != null) 'cid': cid,
        if (contents.isNotEmpty) 'content': contents.map((content) => content.toJson()),
      };
}

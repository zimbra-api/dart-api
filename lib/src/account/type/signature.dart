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

  const Signature({
    this.name,
    this.id,
    this.cid,
    this.contents = const [],
  });

  factory Signature.fromMap(Map<String, dynamic> data) => Signature(
      name: data['name'],
      id: data['id'],
      cid: data['cid'],
      contents: (data['content'] is Iterable)
          ? (data['content'] as Iterable)
              .map<SignatureContent>(
                (content) => SignatureContent.fromMap(content),
              )
              .toList(growable: false)
          : const []);

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (id != null) 'id': id,
        if (cid != null) 'cid': cid,
        if (contents.isNotEmpty)
          'content': contents
              .map(
                (content) => content.toMap(),
              )
              .toList(growable: false),
      };
}

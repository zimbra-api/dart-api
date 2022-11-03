// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'attach_spec.dart';

class MsgAttachSpec extends AttachSpec {
  final String id;

  MsgAttachSpec(this.id, {super.optional});

  factory MsgAttachSpec.fromMap(Map<String, dynamic> data) =>
      MsgAttachSpec(data['id'] ?? '', optional: data['optional']);

  Map<String, dynamic> toMap() => {
        'id': id,
        if (optional != null) 'optional': optional,
      };
}

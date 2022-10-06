// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'attach_spec.dart';

class MsgAttachSpec extends AttachSpec {
  final String id;

  MsgAttachSpec(this.id, {super.optional});

  factory MsgAttachSpec.fromJson(Map<String, dynamic> json) =>
      MsgAttachSpec(json['id'] ?? '', optional: json['optional']);

  Map<String, dynamic> toJson() => {
        'id': id,
        if (optional != null) 'optional': optional,
      };
}

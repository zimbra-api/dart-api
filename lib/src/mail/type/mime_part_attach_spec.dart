// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'attach_spec.dart';

class MimePartAttachSpec extends AttachSpec {
  final String messageId;

  final String part;

  const MimePartAttachSpec(this.messageId, this.part, {super.optional});

  factory MimePartAttachSpec.fromMap(Map<String, dynamic> data) =>
      MimePartAttachSpec(data['mid'] ?? '', data['part'] ?? '', optional: data['optional']);

  Map<String, dynamic> toMap() => {
        'mid': messageId,
        'part': part,
        if (optional != null) 'optional': optional,
      };
}

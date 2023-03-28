// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/content_type.dart';

class SignatureContent {
  final ContentType type;

  final String? value;

  const SignatureContent(this.type, {this.value});

  factory SignatureContent.fromMap(
    Map<String, dynamic> data,
  ) =>
      SignatureContent(
        ContentType.values.firstWhere(
          (item) => item.name == data['type'],
          orElse: () => ContentType.textPlain,
        ),
        value: data['_content'],
      );

  Map<String, dynamic> toMap() => {
        'type': type.name,
        if (value != null) '_content': value,
      };
}

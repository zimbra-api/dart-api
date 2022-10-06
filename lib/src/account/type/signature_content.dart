// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/content_type.dart';

class SignatureContent {
  final ContentType type;

  final String? value;

  SignatureContent(this.type, {this.value});

  factory SignatureContent.fromJson(Map<String, dynamic> json) {
    final type = ContentType.values.firstWhere(
      (item) => item.name == json['type']?.toString(),
      orElse: () => ContentType.textPlain,
    );
    return SignatureContent(type, value: json['_content']);
  }

  Map<String, dynamic> toJson() => {
        'type': type.name,
        if (value != null) '_content': value,
      };
}

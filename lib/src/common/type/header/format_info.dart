// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../enum/request_format.dart';

class FormatInfo {
  final RequestFormat format = RequestFormat.js;

  const FormatInfo();

  factory FormatInfo.fromMap(Map<String, dynamic> data) => FormatInfo();

  Map<String, dynamic> toMap() => {
        'type': format.name,
      };
}

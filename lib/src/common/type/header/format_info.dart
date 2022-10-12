// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/request_format.dart';

class FormatInfo {
  final RequestFormat format = RequestFormat.js;

  FormatInfo();

  factory FormatInfo.fromJson(Map<String, dynamic> json) => FormatInfo();

  Map<String, dynamic> toJson() => {
        'type': format.name,
      };
}

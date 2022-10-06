// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'header/context.dart';

class SoapHeader {
  final Context? context;

  SoapHeader({this.context});

  factory SoapHeader.fromJson(Map<String, dynamic> json) {
    return SoapHeader(context: json['context'] != null ? Context.fromJson(json['context']) : null);
  }

  Map<String, dynamic> toJson() => {
        if (context != null) 'context': context!.toJson(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'header/context.dart';

class SoapHeader {
  final Context? context;

  const SoapHeader({this.context});

  factory SoapHeader.fromMap(Map<String, dynamic> data) =>
      SoapHeader(context: data['context'] is Map ? Context.fromMap(data['context']) : null);

  Map<String, dynamic> toMap() => {
        if (context != null) 'context': context!.toMap(),
      };
}

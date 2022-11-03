// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'dart:convert' as convert;

import 'soap_body.dart';
import 'soap_header.dart';

abstract class SoapEnvelope {
  final SoapHeader? header;

  final SoapBody body;

  SoapEnvelope(this.body, {this.header});

  Map<String, dynamic> toMap() => {
        'Body': body.toMap(),
        if (header != null) 'Header': header!.toMap(),
      };

  String toJson() => convert.jsonEncode(toMap());
}

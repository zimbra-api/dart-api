// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'auto_complete_body.dart';

class AutoCompleteEnvelope extends SoapEnvelope {
  AutoCompleteEnvelope(AutoCompleteBody body, {super.header}) : super(body);

  factory AutoCompleteEnvelope.fromJson(Map<String, dynamic> json) =>
      AutoCompleteEnvelope(AutoCompleteBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  AutoCompleteBody get autoCompleteBody => body as AutoCompleteBody;
}

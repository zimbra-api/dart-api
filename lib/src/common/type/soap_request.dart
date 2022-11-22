// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'soap_header.dart';
import 'soap_envelope.dart';

abstract class SoapRequest {
  SoapEnvelope getEnvelope({SoapHeader? header});

  Map<String, dynamic> toMap();
}

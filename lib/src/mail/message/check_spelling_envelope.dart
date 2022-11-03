// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'check_spelling_body.dart';

class CheckSpellingEnvelope extends SoapEnvelope {
  CheckSpellingEnvelope(CheckSpellingBody body, {super.header}) : super(body);

  factory CheckSpellingEnvelope.fromMap(Map<String, dynamic> data) =>
      CheckSpellingEnvelope(CheckSpellingBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  CheckSpellingBody get checkSpellingBody => body as CheckSpellingBody;
}

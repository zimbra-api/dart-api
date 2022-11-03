// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'auto_complete_gal_body.dart';

class AutoCompleteGalEnvelope extends SoapEnvelope {
  AutoCompleteGalEnvelope(AutoCompleteGalBody body, {super.header}) : super(body..response?.header = header);

  factory AutoCompleteGalEnvelope.fromMap(Map<String, dynamic> data) =>
      AutoCompleteGalEnvelope(AutoCompleteGalBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  AutoCompleteGalBody get autoCompleteGalBody => body as AutoCompleteGalBody;
}

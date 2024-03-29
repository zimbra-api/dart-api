// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'get_available_csv_formats_body.dart';

class GetAvailableCsvFormatsEnvelope extends SoapEnvelope {
  GetAvailableCsvFormatsEnvelope(
    GetAvailableCsvFormatsBody body, {
    super.header,
  }) : super(body..response?.header = header);

  factory GetAvailableCsvFormatsEnvelope.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetAvailableCsvFormatsEnvelope(
        GetAvailableCsvFormatsBody.fromMap(
          data['Body'],
        ),
        header: data['Header'] != null
            ? SoapHeader.fromMap(
                data['Header'],
              )
            : null,
      );
}

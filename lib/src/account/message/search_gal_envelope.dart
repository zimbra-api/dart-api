// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'search_gal_body.dart';

class SearchGalEnvelope extends SoapEnvelope {
  SearchGalEnvelope(
    SearchGalBody body, {
    super.header,
  }) : super(body..response?.header = header);

  factory SearchGalEnvelope.fromMap(
    Map<String, dynamic> data,
  ) =>
      SearchGalEnvelope(
        SearchGalBody.fromMap(data['Body']),
        header: data['Header'] != null
            ? SoapHeader.fromMap(
                data['Header'],
              )
            : null,
      );
}

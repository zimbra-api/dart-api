// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'get_filter_rules_body.dart';

class GetFilterRulesEnvelope extends SoapEnvelope {
  GetFilterRulesEnvelope(
    GetFilterRulesBody body, {
    super.header,
  }) : super(body..response?.header = header);

  factory GetFilterRulesEnvelope.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetFilterRulesEnvelope(
        GetFilterRulesBody.fromMap(data['Body']),
        header: data['Header'] != null
            ? SoapHeader.fromMap(
                data['Header'],
              )
            : null,
      );
}

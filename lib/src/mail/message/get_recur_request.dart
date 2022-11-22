// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'get_recur_body.dart';
import 'get_recur_envelope.dart';

/// Retrieve the recurrence definition of an appointment
class GetRecurRequest extends SoapRequest {
  /// Calendar item ID
  final String id;

  GetRecurRequest(this.id);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetRecurEnvelope(GetRecurBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'id': id,
      };
}

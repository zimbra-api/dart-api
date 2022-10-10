// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_available_locales_body.dart';
import 'get_available_locales_envelope.dart';

/// Get the intersection of all translated locales installed on the server and the list specified in zimbraAvailableLocale.
/// The locale list in the response is sorted by display name (name attribute).
class GetAvailableLocalesRequest extends SoapRequest {
  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetAvailableLocalesEnvelope(GetAvailableLocalesBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
      };
}

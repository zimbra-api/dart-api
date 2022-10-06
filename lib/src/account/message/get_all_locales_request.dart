// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_all_locales_body.dart';
import 'get_all_locales_envelope.dart';

/// Returns all locales defined in the system.  This is the same list returned by
/// java.util.Locale.getAvailableLocales(), sorted by display name (name attribute).
class GetAllLocalesRequest extends SoapRequest {
  @override
  SoapEnvelope getEnvelope() => GetAllLocalesEnvelope(GetAllLocalesBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
      };
}

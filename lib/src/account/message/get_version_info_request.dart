// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_version_info_body.dart';
import 'get_version_info_envelope.dart';

/// Get version information
class GetVersionInfoRequest extends SoapRequest {
  @override
  SoapEnvelope getEnvelope() => GetVersionInfoEnvelope(GetVersionInfoBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
      };
}

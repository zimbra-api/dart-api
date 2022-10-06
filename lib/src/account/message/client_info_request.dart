// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/domain_selector.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'client_info_body.dart';
import 'client_info_envelope.dart';

/// Get client info
class ClientInfoRequest extends SoapRequest {
  /// Domain
  DomainSelector domain;

  ClientInfoRequest(this.domain);

  @override
  SoapEnvelope getEnvelope() => ClientInfoEnvelope(ClientInfoBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        'domain': domain.toJson(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/domain_selector.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import 'client_info_body.dart';
import 'client_info_envelope.dart';

/// Get client info
class ClientInfoRequest extends SoapRequest {
  /// Domain
  final DomainSelector domain;

  ClientInfoRequest(this.domain);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => ClientInfoEnvelope(
        ClientInfoBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        'domain': domain.toMap(),
      };
}

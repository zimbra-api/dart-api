// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_imap_recent_cutoff_body.dart';
import 'get_imap_recent_cutoff_envelope.dart';

/// Return the count of recent items in the specified folder
class GetIMAPRecentCutoffRequest extends SoapRequest {
  /// Folder ID
  final String id;

  GetIMAPRecentCutoffRequest(this.id);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetIMAPRecentCutoffEnvelope(GetIMAPRecentCutoffBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'id': id,
      };
}

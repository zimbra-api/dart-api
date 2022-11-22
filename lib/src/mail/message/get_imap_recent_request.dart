// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'get_imap_recent_body.dart';
import 'get_imap_recent_envelope.dart';

/// Return the count of recent items in the specified folder
class GetIMAPRecentRequest extends SoapRequest {
  /// Folder ID
  final String id;

  GetIMAPRecentRequest(this.id);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetIMAPRecentEnvelope(GetIMAPRecentBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'id': id,
      };
}

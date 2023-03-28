// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'get_contact_backup_list_body.dart';
import 'get_contact_backup_list_envelope.dart';

/// Get list of available contact backups
class GetContactBackupListRequest extends SoapRequest {
  @override
  SoapEnvelope getEnvelope({
    SoapHeader? header,
  }) =>
      GetContactBackupListEnvelope(
        GetContactBackupListBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
      };
}

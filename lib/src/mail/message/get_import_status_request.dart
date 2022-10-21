// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_import_status_body.dart';
import 'get_import_status_envelope.dart';

/// Returns current import status for all data sources.  Status values for a data source
/// Status values for a data source are reinitialized when either (a)
/// another import process is startedor (b) when the server is restarted.
/// If import has not run yet, the success and error attributes are not specified in the response.
class GetImportStatusRequest extends SoapRequest {
  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetImportStatusEnvelope(GetImportStatusBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
      };
}

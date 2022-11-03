// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_appt_summaries_body.dart';
import 'get_appt_summaries_envelope.dart';

/// Get appointment summaries
class GetApptSummariesRequest extends SoapRequest {
  /// Range start in milliseconds since the epoch GMT
  final int startTime;

  /// Range end in milliseconds since the epoch GMT
  final int endTime;

  /// Folder ID. Optional folder to constrain requests to; otherwise, searches all folders but trash and spam
  final String? folderId;

  GetApptSummariesRequest(this.startTime, this.endTime, {this.folderId});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetApptSummariesEnvelope(GetApptSummariesBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        's': startTime,
        'e': endTime,
        if (folderId != null) 'l': folderId,
      };
}

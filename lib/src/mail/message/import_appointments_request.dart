// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/content_spec.dart';
import 'import_appointments_body.dart';
import 'import_appointments_envelope.dart';

/// Import appointments
class ImportAppointmentsRequest extends SoapRequest {
  /// Content specification
  final ContentSpec content;

  /// Content type
  /// Only currently supported content type is "text/calendar" (and its nickname "ics")
  final String contentType;

  /// Optional folder ID to import appointments into
  final String? folderId;

  ImportAppointmentsRequest(
    this.content, {
    this.contentType = 'text/calendar',
    this.folderId,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ImportAppointmentsEnvelope(ImportAppointmentsBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'content': content.toMap(),
        'ct': contentType,
        if (folderId != null) 'l': folderId,
      };
}

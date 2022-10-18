// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'export_contacts_body.dart';
import 'export_contacts_envelope.dart';

/// Export contacts
class ExportContactsRequest extends SoapRequest {
  /// Content type. Currently, the only supported content type is "csv" (comma-separated values)
  final String contentType;

  /// Optional folder id to export contacts from
  final String? folderId;

  /// Optional csv format for exported contacts.  the supported formats are defined in
  /// $ZIMBRA_HOME/conf/zimbra-contact-fields.xml
  final String? csvFormat;

  /// The locale to use when there are multiple {csv-format} locales defined.
  /// When it is not specified, the {csv-format} with no locale specification is used.
  final String? csvLocale;

  /// Optional delimiter character to use in the resulting csv file - usually "," or ";"
  final String? csvDelimiter;

  ExportContactsRequest(this.contentType, {this.folderId, this.csvFormat, this.csvLocale, this.csvDelimiter});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ExportContactsEnvelope(ExportContactsBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'ct': contentType,
        if (folderId != null) 'l': folderId,
        if (csvFormat != null) 'csvfmt': csvFormat,
        if (csvLocale != null) 'csvlocale': csvLocale,
        if (csvDelimiter != null) 'csvsep': csvDelimiter,
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/content.dart';
import 'import_contacts_body.dart';
import 'import_contacts_envelope.dart';

/// Import contacts
class ImportContactsRequest extends SoapRequest {
  /// Content specification
  final Content content;

  /// Content type. Only currenctly supported content type is 'csv'
  final String contentType;

  /// Optional Folder ID to import contacts to
  final String? folderId;

  /// The format of csv being imported. When it's not defined, Zimbra format is assumed.
  /// The supported formats are defined in $ZIMBRA_HOME/conf/zimbra-contact-fields.xml
  final String? csvFormat;

  /// The locale to use when there are multiple <csvfmtt> locales defined.
  /// When it is not specified, the <csvfmtt> with no locale specification is used.
  final String? csvLocale;

  ImportContactsRequest(
    this.content, {
    this.contentType = 'text/csv',
    this.folderId,
    this.csvFormat,
    this.csvLocale,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => ImportContactsEnvelope(
        ImportContactsBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'content': content.toMap(),
        'ct': contentType,
        if (folderId != null) 'l': folderId,
        if (csvFormat != null) 'csvfmt': csvFormat,
        if (csvLocale != null) 'csvlocale': csvLocale,
      };
}

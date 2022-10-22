// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/import_contact.dart';

class ImportContactsResponse extends SoapResponse {
  /// Information about the import process
  final ImportContact? contact;

  ImportContactsResponse({this.contact});

  factory ImportContactsResponse.fromJson(Map<String, dynamic> json) =>
      ImportContactsResponse(contact: json['cn'] != null ? ImportContact.fromJson(json['cn']) : null);
}

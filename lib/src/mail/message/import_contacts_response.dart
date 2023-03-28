// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/import_contact.dart';

class ImportContactsResponse extends SoapResponse {
  /// Information about the import process
  final ImportContact? contact;

  ImportContactsResponse({this.contact});

  factory ImportContactsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      ImportContactsResponse(
        contact: data['cn'] != null
            ? ImportContact.fromMap(
                data['cn'],
              )
            : null,
      );
}

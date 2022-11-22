// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class ExportContactsResponse extends SoapResponse {
  /// Content of the export
  final String? content;

  ExportContactsResponse({this.content});

  factory ExportContactsResponse.fromMap(Map<String, dynamic> data) =>
      ExportContactsResponse(content: data['content']?['_content']);
}

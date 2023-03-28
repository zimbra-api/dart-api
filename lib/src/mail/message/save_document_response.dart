// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/id_version_name.dart';

class SaveDocumentResponse extends SoapResponse {
  /// Details of saved document revision
  final IdVersionName? doc;

  SaveDocumentResponse({this.doc});

  factory SaveDocumentResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      SaveDocumentResponse(
        doc: data['doc'] is Map ? IdVersionName.fromMap(data['doc']) : null,
      );
}

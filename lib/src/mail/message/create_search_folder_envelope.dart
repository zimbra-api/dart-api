// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'create_search_folder_body.dart';

class CreateSearchFolderEnvelope extends SoapEnvelope {
  CreateSearchFolderEnvelope(CreateSearchFolderBody body, {super.header}) : super(body..response?.header = header);

  factory CreateSearchFolderEnvelope.fromMap(Map<String, dynamic> data) =>
      CreateSearchFolderEnvelope(CreateSearchFolderBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  CreateSearchFolderBody get createSearchFolderBody => body as CreateSearchFolderBody;
}

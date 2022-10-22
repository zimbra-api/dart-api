// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_search_folder_body.dart';

class GetSearchFolderEnvelope extends SoapEnvelope {
  GetSearchFolderEnvelope(GetSearchFolderBody body, {super.header}) : super(body);

  factory GetSearchFolderEnvelope.fromJson(Map<String, dynamic> json) =>
      GetSearchFolderEnvelope(GetSearchFolderBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetSearchFolderBody get getSearchFolderBody => body as GetSearchFolderBody;
}

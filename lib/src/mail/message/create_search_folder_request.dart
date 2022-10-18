// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/new_search_folder_spec.dart';

import 'create_search_folder_body.dart';
import 'create_search_folder_envelope.dart';

/// Create a search folder
class CreateSearchFolderRequest extends SoapRequest {
  /// New search folder specification
  final NewSearchFolderSpec searchFolder;

  CreateSearchFolderRequest(this.searchFolder);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CreateSearchFolderEnvelope(CreateSearchFolderBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'search': searchFolder.toJson(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/modify_search_folder_spec.dart';

import 'modify_search_folder_body.dart';
import 'modify_search_folder_envelope.dart';

/// Modify search folder
class ModifySearchFolderRequest extends SoapRequest {
  /// Specification of search folder modifications
  final ModifySearchFolderSpec searchFolder;

  ModifySearchFolderRequest(this.searchFolder);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ModifySearchFolderEnvelope(ModifySearchFolderBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'search': searchFolder.toMap(),
      };
}

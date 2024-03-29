// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/folder_spec.dart';
import 'get_effective_folder_perms_body.dart';
import 'get_effective_folder_perms_envelope.dart';

/// Returns the effective permissions of the specified folder
class GetEffectiveFolderPermsRequest extends SoapRequest {
  /// Folder specification
  final FolderSpec folder;

  GetEffectiveFolderPermsRequest(this.folder);

  @override
  SoapEnvelope getEnvelope({
    SoapHeader? header,
  }) =>
      GetEffectiveFolderPermsEnvelope(
        GetEffectiveFolderPermsBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'folder': folder.toMap(),
      };
}

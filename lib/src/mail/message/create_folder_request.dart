// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/new_folder_spec.dart';
import 'create_folder_body.dart';
import 'create_folder_envelope.dart';

/// Create folder
class CreateFolderRequest extends SoapRequest {
  /// New folder specification
  final NewFolderSpec folder;

  CreateFolderRequest(this.folder);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CreateFolderEnvelope(CreateFolderBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'folder': folder.toMap(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/rights.dart';

class GetEffectiveFolderPermsResponse extends SoapResponse {
  /// Folder permissions information
  final Rights? folder;

  GetEffectiveFolderPermsResponse({this.folder});

  factory GetEffectiveFolderPermsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetEffectiveFolderPermsResponse(
        folder: data['folder'] is Map
            ? Rights.fromMap(
                data['folder'],
              )
            : null,
      );
}

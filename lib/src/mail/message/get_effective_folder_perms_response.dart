// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/rights.dart';

class GetEffectiveFolderPermsResponse extends SoapResponse {
  /// Folder permissions information
  final Rights? folder;

  GetEffectiveFolderPermsResponse({this.folder});

  factory GetEffectiveFolderPermsResponse.fromJson(Map<String, dynamic> json) =>
      GetEffectiveFolderPermsResponse(folder: json['folder'] is Map ? Rights.fromJson(json['folder']) : null);
}

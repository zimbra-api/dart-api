// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/version_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetVersionInfoResponse extends SoapResponse {
  /// Version information
  final VersionInfo? versionInfo;

  GetVersionInfoResponse({this.versionInfo});

  factory GetVersionInfoResponse.fromJson(Map<String, dynamic> json) =>
      GetVersionInfoResponse(versionInfo: json['info'] != null ? VersionInfo.fromJson(json['info']) : null);
}

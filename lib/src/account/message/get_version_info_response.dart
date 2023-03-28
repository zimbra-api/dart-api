// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/version_info.dart';

class GetVersionInfoResponse extends SoapResponse {
  /// Version information
  final VersionInfo? versionInfo;

  GetVersionInfoResponse({this.versionInfo});

  factory GetVersionInfoResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetVersionInfoResponse(
        versionInfo: data['info'] is Map
            ? VersionInfo.fromMap(
                data['info'],
              )
            : null,
      );
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/right_permission.dart';

class CheckPermissionResponse extends SoapResponse {
  /// Set if the authed user has ALL the rights for each <right> element.
  final bool? allow;

  /// Individual right information
  final List<RightPermission> rights;

  CheckPermissionResponse({this.allow, this.rights = const []});

  factory CheckPermissionResponse.fromJson(Map<String, dynamic> json) => CheckPermissionResponse(
      allow: json['allow'],
      rights: (json['right'] is Iterable)
          ? List.from((json['right'] as Iterable).map<RightPermission>((right) => RightPermission.fromJson(right)))
          : []);
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/retention_policy.dart';

class GetSystemRetentionPolicyResponse extends SoapResponse {
  /// System retention policy
  final RetentionPolicy? retentionPolicy;

  GetSystemRetentionPolicyResponse({this.retentionPolicy});

  factory GetSystemRetentionPolicyResponse.fromJson(Map<String, dynamic> json) => GetSystemRetentionPolicyResponse(
      retentionPolicy: json['retentionPolicy'] is Map ? RetentionPolicy.fromJson(json['retentionPolicy']) : null);
}

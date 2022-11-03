// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/fault/fault_detail.dart';

import 'fault/fault_code.dart';
import 'fault/fault_reason.dart';

class SoapFault implements Exception {
  final FaultCode? code;

  final FaultReason? reason;

  final FaultDetail? detail;

  SoapFault({this.code, this.reason, this.detail});

  factory SoapFault.fromMap(Map<String, dynamic> data) => SoapFault(
      code: data['Code'] is Map ? FaultCode.fromMap(data['Code']) : null,
      reason: data['Reason'] is Map ? FaultReason.fromMap(data['Reason']) : null,
      detail: data['Detail'] is Map ? FaultDetail.fromMap(data['Detail']) : null);

  String? faultCode() => code?.value;

  String? faultString() => reason?.text;

  Map<String, dynamic>? faultDetail() => detail?.error;
}

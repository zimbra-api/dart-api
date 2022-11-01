// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/fault/fault_detail.dart';

import 'fault/fault_code.dart';
import 'fault/fault_reason.dart';

class SoapFault {
  final FaultCode? code;

  final FaultReason? reason;

  final FaultDetail? detail;

  SoapFault({this.code, this.reason, this.detail});

  factory SoapFault.fromJson(Map<String, dynamic> json) => SoapFault(
      code: json['Code'] is Map ? FaultCode.fromJson(json['Code']) : null,
      reason: json['Reason'] is Map ? FaultReason.fromJson(json['Reason']) : null,
      detail: json['Detail'] is Map ? FaultDetail.fromJson(json['Detail']) : null);

  String? faultCode() => code?.value;

  String? faultString() => reason?.text;

  Map<String, dynamic>? faultDetail() => detail?.error;
}

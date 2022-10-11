// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'fault/fault_code.dart';
import 'fault/fault_reason.dart';

class SoapFault {
  final FaultCode? code;

  final FaultReason? reason;

  SoapFault({this.code, this.reason});

  factory SoapFault.fromJson(Map<String, dynamic> json) => SoapFault(
        code: json['Code'] != null ? FaultCode.fromJson(json['Code']) : null,
        reason: json['Reason'] != null ? FaultReason.fromJson(json['Reason']) : null,
      );

  String? faultCode() => code?.value;

  String? faultString() => reason?.text;
}

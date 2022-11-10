// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/except_id_info.dart';

class SetAppointmentResponse extends SoapResponse {
  /// Appointment ID
  final String? calItemId;

  /// Deprecated - appointment ID
  final String? deprecatedApptId;

  /// Information about default invite
  final Id? defaultId;

  /// Information about exceptions
  final List<ExceptIdInfo> exceptions;

  SetAppointmentResponse({this.calItemId, this.deprecatedApptId, this.defaultId, this.exceptions = const []});

  factory SetAppointmentResponse.fromMap(Map<String, dynamic> data) => SetAppointmentResponse(
      calItemId: data['calItemId'],
      deprecatedApptId: data['apptId'],
      defaultId: data['default'] is Map ? Id.fromMap(data['default']) : null,
      exceptions: (data['except'] is Iterable)
          ? (data['except'] as Iterable)
              .map<ExceptIdInfo>((except) => ExceptIdInfo.fromMap(except))
              .toList(growable: false)
          : const []);
}

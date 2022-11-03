// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class ImportAppointmentsResponse extends SoapResponse {
  /// List of created IDs
  final String? ids;

  /// Number of imported appointments
  final int? num;

  ImportAppointmentsResponse({this.ids, this.num});

  factory ImportAppointmentsResponse.fromMap(Map<String, dynamic> data) =>
      ImportAppointmentsResponse(ids: data['ids'], num: data['n']);
}

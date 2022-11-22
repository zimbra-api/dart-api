// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class CancelAppointmentResponse extends SoapResponse {
  CancelAppointmentResponse();

  factory CancelAppointmentResponse.fromMap(Map<String, dynamic> data) => CancelAppointmentResponse();
}

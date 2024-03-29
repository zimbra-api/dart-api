// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class AddAppointmentInviteResponse extends SoapResponse {
  /// Calendar item ID
  final int? calItemId;

  /// Invite ID of the added invite
  final int? invId;

  /// Component number of the added invite
  final int? componentNum;

  AddAppointmentInviteResponse({
    this.calItemId,
    this.invId,
    this.componentNum,
  });

  factory AddAppointmentInviteResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      AddAppointmentInviteResponse(
        calItemId: int.tryParse(data['calItemId']?.toString() ?? ''),
        invId: int.tryParse(data['invId']?.toString() ?? ''),
        componentNum: int.tryParse(data['compNum']?.toString() ?? ''),
      );
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class ModifyProfileImageResponse extends SoapResponse {
  /// Item ID of profile image
  final int? itemId;

  ModifyProfileImageResponse({this.itemId});

  factory ModifyProfileImageResponse.fromMap(Map<String, dynamic> data) =>
      ModifyProfileImageResponse(itemId: int.tryParse(data['itemId']?.toString() ?? ''));
}

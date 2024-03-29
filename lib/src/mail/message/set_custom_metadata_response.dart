// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class SetCustomMetadataResponse extends SoapResponse {
  /// Item ID
  final String? id;

  SetCustomMetadataResponse({this.id});

  factory SetCustomMetadataResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      SetCustomMetadataResponse(id: data['id']);
}

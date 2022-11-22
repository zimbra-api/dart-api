// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class GenerateUUIDResponse extends SoapResponse {
  /// Generated globally unique UUID
  final String? uuid;

  GenerateUUIDResponse({this.uuid});

  factory GenerateUUIDResponse.fromMap(Map<String, dynamic> data) => GenerateUUIDResponse(uuid: data['_content']);
}

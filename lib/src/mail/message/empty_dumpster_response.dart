// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class EmptyDumpsterResponse extends SoapResponse {
  EmptyDumpsterResponse();

  factory EmptyDumpsterResponse.fromJson(Map<String, dynamic> json) => EmptyDumpsterResponse();
}

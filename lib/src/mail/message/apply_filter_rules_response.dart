// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/ids_attr.dart';

class ApplyFilterRulesResponse extends SoapResponse {
  final IdsAttr? msgIds;

  ApplyFilterRulesResponse({this.msgIds});

  factory ApplyFilterRulesResponse.fromMap(Map<String, dynamic> data) =>
      ApplyFilterRulesResponse(msgIds: (data['m'] is Map) ? IdsAttr.fromMap(data['m']) : null);
}

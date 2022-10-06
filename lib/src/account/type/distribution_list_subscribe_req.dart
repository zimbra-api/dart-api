// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/distribution_list_subscribe_op.dart';

class DistributionListSubscribeReq {
  /// operation
  DistributionListSubscribeOp op;

  String? value;

  /// Flag whether to bcc all other owners on the accept/reject notification emails.
  bool? bccOwners;

  DistributionListSubscribeReq({this.op = DistributionListSubscribeOp.subscribe, this.value, this.bccOwners});

  Map<String, dynamic> toJson() => {
        'op': op.name,
        if (value != null) '_content': value,
        if (bccOwners != null) 'bccOwners': bccOwners,
      };
}

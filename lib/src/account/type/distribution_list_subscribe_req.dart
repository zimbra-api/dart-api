// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/distribution_list_subscribe_op.dart';

class DistributionListSubscribeReq {
  /// operation
  final DistributionListSubscribeOp op;

  final String? value;

  /// Flag whether to bcc all other owners on the accept/reject notification emails.
  final bool? bccOwners;

  const DistributionListSubscribeReq({
    this.op = DistributionListSubscribeOp.subscribe,
    this.value,
    this.bccOwners,
  });

  Map<String, dynamic> toMap() => {
        'op': op.name,
        if (value != null) '_content': value,
        if (bccOwners != null) 'bccOwners': bccOwners,
      };
}

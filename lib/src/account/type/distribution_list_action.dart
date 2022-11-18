// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/operation.dart';

import 'account_key_value_pairs.dart';
import 'distribution_list_grantee_selector.dart';
import 'distribution_list_right_spec.dart';
import 'distribution_list_subscribe_req.dart';

class DistributionListAction extends AccountKeyValuePairs {
  final Operation op;

  final String? newName;

  final DistributionListSubscribeReq? subsReq;

  final List<String> members;

  final List<DistributionListGranteeSelector> owners;

  final List<DistributionListRightSpec> rights;

  const DistributionListAction(
    this.op, {
    this.newName,
    this.subsReq,
    this.members = const [],
    this.owners = const [],
    this.rights = const [],
    super.keyValuePairs,
  });

  @override
  Map<String, dynamic> toMap() => {
        'op': op.name,
        if (newName != null) 'newName': newName,
        if (subsReq != null) 'subsReq': subsReq!.toMap(),
        if (members.isNotEmpty) 'dlm': members.map((dlm) => {'_content': dlm}).toList(growable: false),
        if (owners.isNotEmpty) 'owner': owners.map((owner) => owner.toMap()).toList(growable: false),
        if (rights.isNotEmpty) 'right': rights.map((right) => right.toMap()).toList(growable: false),
        if (keyValuePairs.isNotEmpty) 'a': keyValuePairs.map((kvp) => kvp.toMap()).toList(growable: false),
      };
}

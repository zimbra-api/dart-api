// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/operation.dart';

import 'account_key_value_pairs.dart';
import 'distribution_list_grantee_selector.dart';
import 'distribution_list_right_spec.dart';
import 'distribution_list_subscribe_req.dart';

class DistributionListAction extends AccountKeyValuePairs {
  Operation op;

  String? newName;

  DistributionListSubscribeReq? subsReq;

  final List<String> members;

  final List<DistributionListGranteeSelector> owners;

  final List<DistributionListRightSpec> rights;

  DistributionListAction(this.op,
      {this.newName,
      this.subsReq,
      this.members = const <String>[],
      this.owners = const <DistributionListGranteeSelector>[],
      this.rights = const <DistributionListRightSpec>[]});

  @override
  Map<String, dynamic> toJson() => {
        'op': op.name,
        if (newName != null) 'newName': newName,
        if (subsReq != null) 'subsReq': subsReq!.toJson(),
        if (members.isNotEmpty) 'dlm': members.map((dlm) => {'_content': dlm}),
        if (owners.isNotEmpty) 'owner': owners.map((owner) => owner.toJson()),
        if (rights.isNotEmpty) 'right': rights.map((right) => right.toJson()),
        if (keyValuePairs.isNotEmpty) 'a': keyValuePairs.map((kvp) => kvp.toJson()),
      };
}

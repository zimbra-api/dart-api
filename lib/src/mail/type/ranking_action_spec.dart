// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/ranking_action_op.dart';

class RankingActionSpec {
  /// Action to perform - reset|delete.
  /// reset: resets the contact ranking table for the account
  /// delete: delete the ranking information for the email address
  final RankingActionOp operation;

  /// Email
  final String? email;

  RankingActionSpec({this.operation = RankingActionOp.reset, this.email});

  factory RankingActionSpec.fromJson(Map<String, dynamic> json) => RankingActionSpec(
      operation: RankingActionOp.values.firstWhere(
        (op) => op.name == json['op'],
        orElse: () => RankingActionOp.reset,
      ),
      email: json['email']);

  Map<String, dynamic> toJson() => {
        'op': operation.name,
        if (email != null) 'email': email,
      };
}

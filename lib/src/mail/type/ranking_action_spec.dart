// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/ranking_action_op.dart';

class RankingActionSpec {
  /// Action to perform - reset|delete.
  /// reset: resets the contact ranking table for the account
  /// delete: delete the ranking information for the email address
  final RankingActionOp operation;

  /// Email
  final String? email;

  const RankingActionSpec({this.operation = RankingActionOp.reset, this.email});

  factory RankingActionSpec.fromMap(Map<String, dynamic> data) => RankingActionSpec(
      operation: RankingActionOp.values.firstWhere(
        (op) => op.name == data['op'],
        orElse: () => RankingActionOp.reset,
      ),
      email: data['email']);

  Map<String, dynamic> toMap() => {
        'op': operation.name,
        if (email != null) 'email': email,
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/mail/type/reject_action.dart';

class ErejectAction extends RejectAction {
  ErejectAction({super.content, super.index});

  factory ErejectAction.fromJson(Map<String, dynamic> json) =>
      ErejectAction(content: json['_content'], index: json['index']);
}

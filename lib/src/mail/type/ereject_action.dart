// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'reject_action.dart';

class ErejectAction extends RejectAction {
  const ErejectAction({super.content, super.index});

  factory ErejectAction.fromMap(Map<String, dynamic> data) => ErejectAction(
        content: data['_content'],
        index: int.tryParse(data['index']?.toString() ?? ''),
      );
}

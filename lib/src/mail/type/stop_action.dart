// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_action.dart';

class StopAction extends FilterAction {
  const StopAction({super.index});

  factory StopAction.fromMap(Map<String, dynamic> data) => StopAction(
        index: int.tryParse(data['index']?.toString() ?? ''),
      );
}

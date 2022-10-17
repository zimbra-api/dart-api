// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id.dart';

class CaldavDataSourceId extends Id {
  CaldavDataSourceId({super.id});

  factory CaldavDataSourceId.fromJson(Map<String, dynamic> json) => CaldavDataSourceId(id: json['id']);
}

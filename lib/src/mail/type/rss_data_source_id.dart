// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id.dart';

class RssDataSourceId extends Id {
  RssDataSourceId({super.id});

  factory RssDataSourceId.fromJson(Map<String, dynamic> json) => RssDataSourceId(id: json['id']);
}

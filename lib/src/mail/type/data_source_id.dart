// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/id.dart';

class DataSourceId extends Id {
  const DataSourceId({super.id});

  factory DataSourceId.fromMap(Map<String, dynamic> data) => DataSourceId(id: data['id']);
}

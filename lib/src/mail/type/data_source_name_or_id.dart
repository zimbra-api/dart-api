// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'name_or_id.dart';

class DataSourceNameOrId extends NameOrId {
  DataSourceNameOrId({super.name, super.id});

  factory DataSourceNameOrId.fromJson(Map<String, dynamic> json) =>
      DataSourceNameOrId(name: json['name'], id: json['id']);
}

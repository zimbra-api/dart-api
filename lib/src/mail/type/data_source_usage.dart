// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class DataSourceUsage {
  final String id;

  final int usage;

  const DataSourceUsage({this.id = '', this.usage = 0});

  factory DataSourceUsage.fromMap(Map<String, dynamic> data) =>
      DataSourceUsage(id: data['id'] ?? '', usage: int.tryParse(data['usage']?.toString() ?? '') ?? 0);

  Map<String, dynamic> toMap() => {
        'id': id,
        'usage': usage,
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class DataSourceUsage {
  final String id;

  final int usage;

  DataSourceUsage({this.id = '', this.usage = 0});

  factory DataSourceUsage.fromJson(Map<String, dynamic> json) =>
      DataSourceUsage(id: json['id'] ?? '', usage: json['usage'] ?? 0);

  Map<String, dynamic> toJson() => {
        'id': id,
        'usage': usage,
      };
}

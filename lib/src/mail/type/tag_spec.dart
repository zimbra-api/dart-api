// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Input for creating a new tag
class TagSpec {
  /// Tag name
  final String name;

  /// RGB color in format #rrggbb where r,g and b are hex digits
  final String? rgb;

  /// Color numeric; range 0-127; defaults to 0 if not present; client can display only 0-7
  final int? color;

  const TagSpec(this.name, {this.rgb, this.color});

  factory TagSpec.fromMap(Map<String, dynamic> data) =>
      TagSpec(data['name'] ?? '', rgb: data['rgb'], color: int.tryParse(data['color']?.toString() ?? ''));

  Map<String, dynamic> toMap() => {
        'name': name,
        if (rgb != null) 'rgb': rgb,
        if (color != null) 'color': color,
      };
}

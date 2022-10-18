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

  TagSpec(this.name, {this.rgb, this.color});

  factory TagSpec.fromJson(Map<String, dynamic> json) =>
      TagSpec(json['name'] ?? '', rgb: json['rgb'], color: json['color']);

  Map<String, dynamic> toJson() => {
        'name': name,
        if (rgb != null) 'rgb': rgb,
        if (color != null) 'color': color,
      };
}
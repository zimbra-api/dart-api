// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class IdsAttr {
  /// IDs
  final String ids;

  IdsAttr(this.ids);

  factory IdsAttr.fromJson(Map<String, dynamic> json) => IdsAttr(json['ids'] ?? '');

  Map<String, dynamic> toJson() => {
        'ids': ids,
      };
}

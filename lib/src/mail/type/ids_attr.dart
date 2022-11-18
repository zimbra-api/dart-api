// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class IdsAttr {
  /// IDs
  final String ids;

  const IdsAttr(this.ids);

  factory IdsAttr.fromMap(Map<String, dynamic> data) => IdsAttr(data['ids'] ?? '');

  Map<String, dynamic> toMap() => {
        'ids': ids,
      };
}

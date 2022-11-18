// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class SimpleSearchHit {
  /// Id
  final String? id;

  /// Sort field value
  final String? sortField;

  const SimpleSearchHit({this.id, this.sortField});

  factory SimpleSearchHit.fromMap(Map<String, dynamic> data) => SimpleSearchHit(id: data['id'], sortField: data['sf']);

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (sortField != null) 'sf': sortField,
      };
}

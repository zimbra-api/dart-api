// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class SimpleSearchHit {
  /// Id
  final String? id;

  /// Sort field value
  final String? sortField;

  SimpleSearchHit({this.id, this.sortField});

  factory SimpleSearchHit.fromJson(Map<String, dynamic> json) => SimpleSearchHit(id: json['id'], sortField: json['sf']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (sortField != null) 'sf': sortField,
      };
}

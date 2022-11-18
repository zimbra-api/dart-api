// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Session {
  final String id;

  final String? type;

  const Session(this.id, {this.type});

  factory Session.fromMap(Map<String, dynamic> data) => Session(data['id'], type: data['type']);

  Map<String, dynamic> toMap() => {
        'id': id,
        if (type != null) 'type': type,
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Session {
  String id;

  String? type;

  Session(this.id, {this.type});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(json['id'], type: json['type']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        if (type != null) 'type': type,
      };
}

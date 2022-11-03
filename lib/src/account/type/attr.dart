// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Attr {
  final String name;

  final String? value;

  final bool? permDenied;

  Attr(this.name, {this.value, this.permDenied});

  factory Attr.fromMap(Map<String, dynamic> data) =>
      Attr(data['name'], value: data['_content'], permDenied: data['pd']);

  Map<String, dynamic> toMap() => {
        'name': name,
        if (permDenied != null) 'pd': permDenied,
        if (value != null) '_content': value,
      };
}

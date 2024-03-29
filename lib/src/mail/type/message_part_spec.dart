// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class MessagePartSpec {
  /// Part ID
  final String? part;

  /// Message ID
  final String? id;

  const MessagePartSpec({this.part, this.id});

  factory MessagePartSpec.fromMap(
    Map<String, dynamic> data,
  ) =>
      MessagePartSpec(
        part: data['part'],
        id: data['id'],
      );

  Map<String, dynamic> toMap() => {
        if (part != null) 'part': part,
        if (id != null) 'id': id,
      };
}

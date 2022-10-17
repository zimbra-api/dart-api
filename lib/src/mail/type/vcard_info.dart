// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Input for creating a new contact VCard
class VCardInfo {
  /// Message ID. Use in conjunction with part-identifier
  final String? messageId;

  /// Part identifier. Use in conjunction with message-id
  final String? part;

  /// Uploaded attachment ID
  final String? attachId;

  /// Inlined VCARD data
  final String? value;

  VCardInfo({this.messageId, this.part, this.attachId, this.value});

  factory VCardInfo.fromJson(Map<String, dynamic> json) =>
      VCardInfo(messageId: json['mid'], part: json['part'], attachId: json['aid'], value: json['_content']);

  Map<String, dynamic> toJson() => {
        if (messageId != null) 'mid': messageId,
        if (part != null) 'part': part,
        if (attachId != null) 'aid': attachId,
        if (value != null) '_content': value,
      };
}

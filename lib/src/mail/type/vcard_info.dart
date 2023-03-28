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

  const VCardInfo({this.messageId, this.part, this.attachId, this.value});

  factory VCardInfo.fromMap(Map<String, dynamic> data) => VCardInfo(
        messageId: data['mid'],
        part: data['part'],
        attachId: data['aid'],
        value: data['_content'],
      );

  Map<String, dynamic> toMap() => {
        if (messageId != null) 'mid': messageId,
        if (part != null) 'part': part,
        if (attachId != null) 'aid': attachId,
        if (value != null) '_content': value,
      };
}

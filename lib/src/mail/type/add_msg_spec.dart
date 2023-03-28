// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AddMsgSpec {
  /// Flags - (u)nread, (f)lagged, has (a)ttachment, (r)eplied, (s)ent by me, for(w)arded,
  /// (d)raft, deleted (x), (n)otification sent
  final String? flags;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma-separated list of tag names
  final String? tagNames;

  /// Folder pathname (starts with '/') or folder ID
  final String? folder;

  /// If set, then don't process iCal attachments. Default is unset.
  final bool? noICal;

  /// (optional) Time the message was originally received, in MILLISECONDS since the epoch
  final int? dateReceived;

  /// Uploaded MIME body ID - ID of message uploaded via FileUploadServlet
  final String? attachmentId;

  /// The entire message's content.  (Omit if you specify an "aid" attribute.)
  /// No <mp> elements should be provided within <m>.
  final String? content;

  const AddMsgSpec({
    this.flags,
    this.tags,
    this.tagNames,
    this.folder,
    this.noICal,
    this.dateReceived,
    this.attachmentId,
    this.content,
  });

  factory AddMsgSpec.fromMap(Map<String, dynamic> data) => AddMsgSpec(
        flags: data['f'],
        tags: data['t'],
        tagNames: data['tn'],
        folder: data['l'],
        noICal: data['noICal'],
        dateReceived: int.tryParse(data['d']?.toString() ?? ''),
        attachmentId: data['aid'],
        content: data['content']?['_content'],
      );

  Map<String, dynamic> toMap() => {
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (folder != null) 'l': folder,
        if (noICal != null) 'noICal': noICal,
        if (dateReceived != null) 'd': dateReceived,
        if (attachmentId != null) 'aid': attachmentId,
        if (content != null) 'content': {'_content': content},
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Input for creating a new note
class NewNoteSpec {
  /// Parent Folder ID
  final String? folder;

  /// Content
  final String? content;

  /// Color numeric; range 0-127; defaults to 0 if not present; client can display only 0-7
  final int? color;

  /// Bounds - x,y[width,height] where x,y,width and height are all ints
  final String? bounds;

  const NewNoteSpec({this.folder, this.content, this.color, this.bounds});

  factory NewNoteSpec.fromMap(Map<String, dynamic> data) =>
      NewNoteSpec(
      folder: data['l'],
      content: data['content'],
      color: int.tryParse(data['color']?.toString() ?? ''),
      bounds: data['pos']);

  Map<String, dynamic> toMap() => {
        if (folder != null) 'l': folder,
        if (content != null) 'content': content,
        if (color != null) 'color': color,
        if (bounds != null) 'pos': bounds,
      };
}

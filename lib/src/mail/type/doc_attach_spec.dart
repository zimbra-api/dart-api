// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'attach_spec.dart';

class DocAttachSpec extends AttachSpec {
  /// Document path. If specified "id" and "ver" attributes are ignored
  final String? path;

  /// Item ID
  final String? id;

  /// Optional version.
  final int? version;

  DocAttachSpec({this.path, this.id, this.version, super.optional});

  factory DocAttachSpec.fromMap(Map<String, dynamic> data) =>
      DocAttachSpec(
      path: data['path'],
      id: data['id'],
      version: int.tryParse(data['ver']?.toString() ?? ''),
      optional: data['optional']);

  Map<String, dynamic> toMap() => {
        if (path != null) 'path': path,
        if (id != null) 'id': id,
        if (version != null) 'ver': version,
        if (optional != null) 'optional': optional,
      };
}

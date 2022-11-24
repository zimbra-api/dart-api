// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/get_folder_spec.dart';
import 'get_folder_body.dart';
import 'get_folder_envelope.dart';

/// Get folder
///
/// A {base-folder-id}, a {base-folder-uuid} or a {fully-qualified-path} can optionally be specified in the folder element;
/// if none is present, the descent of the folder hierarchy begins at the mailbox's root folder (id 1).
///
/// If {fully-qualified-path} is present and {base-folder-id} or {base-folder-uuid} is also present,
/// the path is treated as relative to the folder that was specified by id/uuid.
/// {base-folder-id} is ignored if {base-folder-uuid} is present.
class GetFolderRequest extends SoapRequest {
  /// Folder specification
  final GetFolderSpec folder;

  /// If set we include all visible subfolders of the specified folder.
  final bool? isVisible;

  /// If set then grantee names are supplied in the "d" attribute in <grant>.
  final bool? needGranteeName;

  /// If "view" is set then only the folders with matching view will be returned.
  /// Otherwise folders with any default views will be returned.
  final String? viewConstraint;

  /// If "depth" is set to a non-negative number, we include that many levels of subfolders in the response.
  /// (so if depth="1", we'll include only the folder and its direct subfolders)
  /// If depth is missing or negative, the entire folder hierarchy is returned
  final int? treeDepth;

  /// If true, one level of mountpoints are traversed and the target folder's counts are applied to the local mountpoint.
  /// If the root folder as referenced by <b>{base-folder-id}</b> and/or {fully-qualified-path} is a mountpoint,
  /// "tr" is regarded as being automatically set.
  /// Mountpoints under mountpoints are not themselves expanded.
  final bool? traverseMountpoints;

  GetFolderRequest(
    this.folder, {
    this.isVisible,
    this.needGranteeName,
    this.viewConstraint,
    this.treeDepth,
    this.traverseMountpoints,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetFolderEnvelope(GetFolderBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'folder': folder.toMap(),
        if (isVisible != null) 'visible': isVisible,
        if (needGranteeName != null) 'needGranteeName': needGranteeName,
        if (viewConstraint != null) 'view': viewConstraint,
        if (treeDepth != null) 'depth': treeDepth,
        if (traverseMountpoints != null) 'tr': traverseMountpoints,
      };
}

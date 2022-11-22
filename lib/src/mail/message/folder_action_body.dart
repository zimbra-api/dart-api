// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'folder_action_request.dart';
import 'folder_action_response.dart';

class FolderActionBody extends SoapBody {
  FolderActionBody({FolderActionRequest? request, FolderActionResponse? response})
      : super(request: request, response: response);

  factory FolderActionBody.fromMap(Map<String, dynamic> data) => FolderActionBody(
      response:
          data['FolderActionResponse'] != null ? FolderActionResponse.fromMap(data['FolderActionResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'FolderActionRequest': request!.toMap(),
      };
}

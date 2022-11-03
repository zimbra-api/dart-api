// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'save_draft_request.dart';
import 'save_draft_response.dart';

class SaveDraftBody extends SoapBody {
  SaveDraftBody({SaveDraftRequest? request, SaveDraftResponse? response})
      : super(request: request, response: response);

  factory SaveDraftBody.fromMap(Map<String, dynamic> data) => SaveDraftBody(
      response: data['SaveDraftResponse'] != null ? SaveDraftResponse.fromMap(data['SaveDraftResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SaveDraftRequest': request!.toMap(),
      };
}

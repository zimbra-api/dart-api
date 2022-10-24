// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'save_draft_request.dart';
import 'save_draft_response.dart';

class SaveDraftBody extends SoapBody {
  SaveDraftBody({SaveDraftRequest? request, SaveDraftResponse? response, super.fault})
      : super(request: request, response: response);

  factory SaveDraftBody.fromJson(Map<String, dynamic> json) => SaveDraftBody(
      response: json['SaveDraftResponse'] != null ? SaveDraftResponse.fromJson(json['SaveDraftResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SaveDraftRequest? get saveDraftRequest => request as SaveDraftRequest?;

  SaveDraftResponse? get saveDraftResponse => response as SaveDraftResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SaveDraftRequest': request!.toJson(),
      };
}

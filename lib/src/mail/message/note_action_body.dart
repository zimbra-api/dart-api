// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'note_action_request.dart';
import 'note_action_response.dart';

class NoteActionBody extends SoapBody {
  NoteActionBody({NoteActionRequest? request, NoteActionResponse? response, super.fault})
      : super(request: request, response: response);

  factory NoteActionBody.fromJson(Map<String, dynamic> json) => NoteActionBody(
      response: json['NoteActionResponse'] != null ? NoteActionResponse.fromJson(json['NoteActionResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  NoteActionRequest? get noteActionRequest => request as NoteActionRequest?;

  NoteActionResponse? get noteActionResponse => response as NoteActionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'NoteActionRequest': request!.toJson(),
      };
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_note_request.dart';
import 'get_note_response.dart';

class GetNoteBody extends SoapBody {
  GetNoteBody({GetNoteRequest? request, GetNoteResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetNoteBody.fromJson(Map<String, dynamic> json) => GetNoteBody(
      response: json['GetNoteResponse'] != null ? GetNoteResponse.fromJson(json['GetNoteResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetNoteRequest? get getNoteRequest => request as GetNoteRequest?;

  GetNoteResponse? get getNoteResponse => response as GetNoteResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetNoteRequest': request!.toJson(),
      };
}

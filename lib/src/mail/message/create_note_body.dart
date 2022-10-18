// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_note_request.dart';
import 'create_note_response.dart';

class CreateNoteBody extends SoapBody {
  CreateNoteBody({CreateNoteRequest? request, CreateNoteResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateNoteBody.fromJson(Map<String, dynamic> json) => CreateNoteBody(
      response: json['CreateNoteResponse'] != null ? CreateNoteResponse.fromJson(json['CreateNoteResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateNoteRequest? get createNoteRequest => request as CreateNoteRequest?;

  CreateNoteResponse? get createNoteResponse => response as CreateNoteResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateNoteRequest': request!.toJson(),
      };
}

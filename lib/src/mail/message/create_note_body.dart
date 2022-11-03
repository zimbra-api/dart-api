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

  factory CreateNoteBody.fromMap(Map<String, dynamic> data) => CreateNoteBody(
      response: data['CreateNoteResponse'] != null ? CreateNoteResponse.fromMap(data['CreateNoteResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  CreateNoteRequest? get createNoteRequest => request as CreateNoteRequest?;

  CreateNoteResponse? get createNoteResponse => response as CreateNoteResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateNoteRequest': request!.toMap(),
      };
}

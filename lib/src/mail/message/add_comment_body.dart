// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'add_comment_request.dart';
import 'add_comment_response.dart';

class AddCommentBody extends SoapBody {
  AddCommentBody({AddCommentRequest? request, AddCommentResponse? response, super.fault})
      : super(request: request, response: response);

  factory AddCommentBody.fromMap(Map<String, dynamic> data) => AddCommentBody(
      response: data['AddCommentResponse'] != null ? AddCommentResponse.fromMap(data['AddCommentResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'AddCommentRequest': request!.toMap(),
      };
}

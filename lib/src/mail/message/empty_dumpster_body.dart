// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'empty_dumpster_request.dart';
import 'empty_dumpster_response.dart';

class EmptyDumpsterBody extends SoapBody {
  EmptyDumpsterBody({EmptyDumpsterRequest? request, EmptyDumpsterResponse? response})
      : super(request: request, response: response);

  factory EmptyDumpsterBody.fromMap(Map<String, dynamic> data) => EmptyDumpsterBody(
      response:
          data['EmptyDumpsterResponse'] != null ? EmptyDumpsterResponse.fromMap(data['EmptyDumpsterResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'EmptyDumpsterRequest': request!.toMap(),
      };
}

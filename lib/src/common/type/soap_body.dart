// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'soap_request.dart';
import 'soap_response.dart';

abstract class SoapBody {
  final SoapRequest? request;

  final SoapResponse? response;

  SoapBody({this.request, this.response});

  Map<String, dynamic> toMap();
}

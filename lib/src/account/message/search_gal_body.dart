// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'search_gal_request.dart';
import 'search_gal_response.dart';

class SearchGalBody extends SoapBody {
  SearchGalBody({SearchGalRequest? request, SearchGalResponse? response, super.fault})
      : super(request: request, response: response);

  factory SearchGalBody.fromMap(Map<String, dynamic> data) => SearchGalBody(
      response: data['SearchGalResponse'] != null ? SearchGalResponse.fromMap(data['SearchGalResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  SearchGalRequest? get searchGalRequest => request as SearchGalRequest?;

  SearchGalResponse? get searchGalResponse => response as SearchGalResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SearchGalRequest': request!.toMap(),
      };
}

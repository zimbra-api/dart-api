// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'announce_organizer_change_request.dart';
import 'announce_organizer_change_response.dart';

class AnnounceOrganizerChangeBody extends SoapBody {
  AnnounceOrganizerChangeBody(
      {AnnounceOrganizerChangeRequest? request, AnnounceOrganizerChangeResponse? response, super.fault})
      : super(request: request, response: response);

  factory AnnounceOrganizerChangeBody.fromJson(Map<String, dynamic> json) => AnnounceOrganizerChangeBody(
      response: json['AnnounceOrganizerChangeResponse'] != null
          ? AnnounceOrganizerChangeResponse.fromJson(json['AnnounceOrganizerChangeResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  AnnounceOrganizerChangeRequest? get announceOrganizerChangeRequest => request as AnnounceOrganizerChangeRequest?;

  AnnounceOrganizerChangeResponse? get announceOrganizerChangeResponse => response as AnnounceOrganizerChangeResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'AnnounceOrganizerChangeRequest': request!.toJson(),
      };
}

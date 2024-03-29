// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'announce_organizer_change_request.dart';
import 'announce_organizer_change_response.dart';

class AnnounceOrganizerChangeBody extends SoapBody {
  AnnounceOrganizerChangeBody({
    AnnounceOrganizerChangeRequest? request,
    AnnounceOrganizerChangeResponse? response,
  }) : super(request: request, response: response);

  factory AnnounceOrganizerChangeBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      AnnounceOrganizerChangeBody(
        response: data['AnnounceOrganizerChangeResponse'] != null
            ? AnnounceOrganizerChangeResponse.fromMap(
                data['AnnounceOrganizerChangeResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'AnnounceOrganizerChangeRequest': request!.toMap(),
      };
}

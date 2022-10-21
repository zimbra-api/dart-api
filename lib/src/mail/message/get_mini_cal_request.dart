// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/cal_tz_info.dart';

import 'get_mini_cal_body.dart';
import 'get_mini_cal_envelope.dart';

/// Get information needed for Mini Calendar.
/// Date is returned if there is at least one appointment on that date.
/// The date computation uses the requesting (authenticated) account's time zone,
/// not the time zone of the account that owns the calendar folder.
class GetMiniCalRequest extends SoapRequest {
  /// Range start time in milliseconds
  final int startTime;

  /// Range end time in milliseconds
  final int endTime;

  /// Local and/or remote calendar folders
  final List<Id> folders;

  /// Optional timezone specifier.
  /// References an existing server-known timezone by ID or the full specification of a custom timezone
  final CalTZInfo? timezone;

  GetMiniCalRequest(this.startTime, this.endTime, {this.folders = const [], this.timezone});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetMiniCalEnvelope(GetMiniCalBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        's': startTime,
        'e': endTime,
        if (folders.isNotEmpty) 'folder': folders.map((folder) => folder.toJson()).toList(),
        if (timezone != null) 'tz': timezone!.toJson(),
      };
}

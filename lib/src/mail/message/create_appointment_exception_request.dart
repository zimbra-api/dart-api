// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/mail/type/cal_item_request_base.dart';

import 'create_appointment_exception_body.dart';
import 'create_appointment_exception_envelope.dart';

/// Create appointment exception.
class CreateAppointmentExceptionRequest extends CalItemRequestBase {
  /// ID of default invite
  final String? id;

  /// Component of default invite
  final int? numComponents;

  /// Change sequence of fetched series
  final int? modifiedSequence;

  /// Revision of fetched series
  final int? revision;

  CreateAppointmentExceptionRequest( 
      {this.id,
      this.numComponents,
      this.modifiedSequence,
      this.revision,
      super.echo,
      super.maxSize,
      super.wantHtml,
      super.neuter,
      super.forceSend,
      super.msg});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CreateAppointmentExceptionEnvelope(CreateAppointmentExceptionBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        if (id != null) 'id': id,
        if (numComponents != null) 'comp': numComponents,
        if (modifiedSequence != null) 'ms': modifiedSequence,
        if (revision != null) 'rev': revision,
        if (echo != null) 'echo': echo,
        if (maxSize != null) 'max': maxSize,
        if (wantHtml != null) 'want': wantHtml,
        if (neuter != null) 'neuter': neuter,
        if (forceSend != null) 'forcesend': forceSend,
        if (msg != null) 'm': msg!.toJson(),
      };
}

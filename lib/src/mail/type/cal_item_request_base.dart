// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/msg.dart';

abstract class CalItemRequestBase extends SoapRequest {
  /// If specified, the created appointment is echoed back in the response as if a GetMsgRequest was made
  final bool? echo;

  /// Maximum inlined length
  final int? maxSize;

  /// Set if want HTML included in echoing
  final bool? wantHtml;

  /// Set if want "neuter" set for echoed response
  final bool? neuter;

  /// If set, ignore smtp 550 errors when sending the notification to attendees.
  /// If unset, throw the soapfaultexception with invalid addresses so that client
  /// can give the forcesend option to the end user. The default is true.
  final bool? forceSend;

  /// Message information
  final Msg? msg;

  CalItemRequestBase({this.echo, this.maxSize, this.wantHtml, this.neuter, this.forceSend, this.msg});

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (echo != null) 'echo': echo,
        if (maxSize != null) 'max': maxSize,
        if (wantHtml != null) 'want': wantHtml,
        if (neuter != null) 'neuter': neuter,
        if (forceSend != null) 'forcesend': forceSend,
        if (msg != null) 'm': msg!.toMap(),
      };
}

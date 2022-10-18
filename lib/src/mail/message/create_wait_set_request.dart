// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/interest_type.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/common/type/wait_set_add_spec.dart';

import 'create_wait_set_body.dart';
import 'create_wait_set_envelope.dart';

/// Create a waitset to listen for changes on one or more accounts
/// Called once to initialize a WaitSet and to set its "default interest types"
/// WaitSet: scalable mechanism for listening for changes to one or more accounts
class CreateWaitSetRequest extends SoapRequest {
  /// Default interest types: comma-separated list. Currently:
  /// f: folders
  /// m: messages
  /// c: contacts
  /// a: appointments
  /// t: tasks
  /// d: documents
  /// all: all types (equiv to 'f,m,c,a,t,d')
  ///
  /// This is used if types isn't specified for an account
  final String? defaultInterests;

  /// If {all-accounts} is set, then all mailboxes on the system will be listened
  /// to, including any mailboxes which are created on the system while the WaitSet is in existence.
  /// Additionally:
  /// - <add>, <remove> and <update> tags are IGNORED
  /// - The requesting authtoken must be an admin token
  /// AllAccounts WaitSets are *semi-persistent*, that is, even if the server restarts, it is OK to call
  /// <WaitSetRequest> passing in your previous sequence number.
  /// The server will attempt to resynchronize the waitset using the sequence number you provide
  /// (the server's ability to do this is limited by the RedoLogs that are available)
  final bool? allAccounts;

  /// Waitsets to add
  final List<WaitSetAddSpec> accounts;

  CreateWaitSetRequest({this.defaultInterests, this.allAccounts, this.accounts = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CreateWaitSetEnvelope(CreateWaitSetBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        if (defaultInterests != null)
          'defTypes': defaultInterests!
              .split(',')
              .toSet()
              .where((type) => InterestType.values.any((element) => element.name == type))
              .join(','),
        if (allAccounts != null) 'allAccounts': allAccounts,
        if (accounts.isNotEmpty) 'add': {'a': accounts.map((a) => a.toJson()).toList()},
      };
}

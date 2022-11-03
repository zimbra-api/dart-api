// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/account_data_sources.dart';
import 'package:zimbra_api/src/account/type/account_zimlet_info.dart';
import 'package:zimbra_api/src/account/type/attr.dart';
import 'package:zimbra_api/src/account/type/child_account.dart';
import 'package:zimbra_api/src/account/type/cos.dart';
import 'package:zimbra_api/src/account/type/discover_rights_info.dart';
import 'package:zimbra_api/src/account/type/identity.dart';
import 'package:zimbra_api/src/account/type/license_info.dart';
import 'package:zimbra_api/src/account/type/pref.dart';
import 'package:zimbra_api/src/account/type/prop.dart';
import 'package:zimbra_api/src/account/type/signature.dart';
import 'package:zimbra_api/src/account/utils.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetInfoResponse extends SoapResponse {
  /// The size limit for attachments - Use "-1" to mean unlimited
  final int? attachmentSizeLimit;

  /// The size limit for documents
  final int? documentSizeLimit;

  /// Server version: <major>[.<minor>[.<maintenance>]][build] <release> <date>[<type>]
  final String? version;

  /// Account ID
  final String? accountId;

  /// Profile image ID
  final int? profileImageId;

  /// Email address (user@domain)
  final String? accountName;

  /// Crumb
  final String? crumb;

  /// Number of milliseconds until auth token expires
  final int? lifetime;

  /// true if the auth token is a delegated auth token issued to an admin account
  final bool? adminDelegated;

  /// Base REST URL for the requested account
  final String? restUrl;

  /// Mailbox quota used in bytes.
  /// Returned only if the command successfully executes on the target user's home mail server
  final int? quotaUsed;

  /// Time (in millis) of last write op from this session, or from *any* SOAP session if we don't have one
  /// Returned only if the command successfully executes on the target user's home mail server
  final int? previousSessionTime;

  /// Time (in millis) of last write op from any SOAP session before this session was initiated,
  /// or same as {previous-SOAP-session-time} if we don't have one.
  /// Returned only if the command successfully executes on the target user's home mail server
  final int? lastWriteAccessTime;

  /// Number of messages received since the previous soap session, or since the last SOAP write op if we don't have a session.
  /// Returned only if the command successfully executes on the target user's home mail server
  final int? recentMessageCount;

  /// Class of service
  final Cos? cos;

  /// User-settable preferences
  final List<Pref> prefs;

  /// Account attributes that aren't user-settable, but the front-end needs.
  /// Only attributes listed in zimbraAccountClientAttrs will be returned.
  final List<Attr> attrs;

  /// Zimlets
  final List<AccountZimletInfo> zimlets;

  /// Properties
  final List<Prop> props;

  /// Identities
  final List<Identity> identities;

  /// Signatures
  final List<Signature> signatures;

  /// Data sources
  final AccountDataSources? dataSources;

  /// Child accounts
  final List<ChildAccount> childAccounts;

  /// Discovered Rights - same as for DiscoverRightsResponse
  final List<DiscoverRightsInfo> discoveredRights;

  /// URL to talk to for soap service for this account.
  final String? soapURL;

  /// Base public URL for the requested account
  final String? publicURL;

  /// URL to talk to in order to change a password.
  /// Not returned if not configured via domain attribute zimbraChangePasswordURL
  final String? changePasswordURL;

  /// base URL for accessing the admin console
  final String? adminURL;

  /// Proxy URL for accessing XMPP over BOSH.
  /// Should be returned only when zimbraFeatureChatEnabled is set to TRUE for Account/COS
  final String? boshURL;

  /// License information. Only present for Network Edition
  final LicenseInfo? license;

  /// Boolean value denoting if this account has logged in over IMAP.
  final bool? isTrackingIMAP;

  GetInfoResponse(
      {this.attachmentSizeLimit,
      this.documentSizeLimit,
      this.version,
      this.accountId,
      this.profileImageId,
      this.accountName,
      this.crumb,
      this.lifetime,
      this.adminDelegated,
      this.restUrl,
      this.quotaUsed,
      this.previousSessionTime,
      this.lastWriteAccessTime,
      this.recentMessageCount,
      this.cos,
      this.prefs = const [],
      this.attrs = const [],
      this.zimlets = const [],
      this.props = const [],
      this.identities = const [],
      this.signatures = const [],
      this.dataSources,
      this.childAccounts = const [],
      this.discoveredRights = const [],
      this.soapURL,
      this.publicURL,
      this.changePasswordURL,
      this.adminURL,
      this.boshURL,
      this.license,
      this.isTrackingIMAP});

  factory GetInfoResponse.fromMap(Map<String, dynamic> data) => GetInfoResponse(
        attachmentSizeLimit: data['attSizeLimit'],
        documentSizeLimit: data['docSizeLimit'],
        version: data['version'],
        accountId: data['id'],
        profileImageId: data['profileImageId'],
        accountName: data['name'],
        crumb: data['crumb'],
        lifetime: data['lifetime'],
        adminDelegated: data['adminDelegated'],
        restUrl: data['rest'],
        quotaUsed: data['used'],
        previousSessionTime: data['prevSession'],
        lastWriteAccessTime: data['accessed'],
        recentMessageCount: data['recent'],
        cos: data['cos'] is Map ? Cos.fromMap(data['cos']) : null,
        dataSources: data['dataSources'] is Map ? AccountDataSources.fromMap(data['dataSources']) : null,
        soapURL: data['soapURL'],
        publicURL: data['publicURL'],
        changePasswordURL: data['changePasswordURL'],
        adminURL: data['adminURL'],
        boshURL: data['boshURL'],
        license: data['license'] is Map ? LicenseInfo.fromMap(data['license']) : null,
        isTrackingIMAP: data['isTrackingIMAP'],
        prefs: (data['prefs']?['_attrs'] is Map)
            ? List.from(Utils.prefsFromJson(data['prefs']['_attrs'] as Map<String, dynamic>))
            : [],
        attrs: (data['attrs']?['_attrs'] is Map)
            ? List.from(Utils.attrsFromJson(data['attrs']['_attrs'] as Map<String, dynamic>))
            : [],
        zimlets: (data['zimlets']?['zimlet'] is Iterable)
            ? List.from((data['zimlets']['zimlet'] as Iterable)
                .map<AccountZimletInfo>((zimlet) => AccountZimletInfo.fromMap(zimlet)))
            : [],
        props: (data['props']?['prop'] is Iterable)
            ? List.from((data['props']['prop'] as Iterable).map<Prop>((prop) => Prop.fromMap(prop)))
            : [],
        identities: (data['identities']?['identity'] is Iterable)
            ? List.from(
                (data['identities']['identity'] as Iterable).map<Identity>((identity) => Identity.fromMap(identity)))
            : [],
        signatures: (data['signatures']?['signature'] is Iterable)
            ? List.from((data['signatures']['signature'] as Iterable)
                .map<Signature>((signature) => Signature.fromMap(signature)))
            : [],
        childAccounts: (data['childAccounts']?['childAccount'] is Iterable)
            ? List.from((data['childAccounts']['childAccount'] as Iterable)
                .map<ChildAccount>((childAccount) => ChildAccount.fromMap(childAccount)))
            : [],
        discoveredRights: (data['rights']?['targets'] is Iterable)
            ? List.from((data['rights']['targets'] as Iterable)
                .map<DiscoverRightsInfo>((targets) => DiscoverRightsInfo.fromMap(targets)))
            : [],
      );
}

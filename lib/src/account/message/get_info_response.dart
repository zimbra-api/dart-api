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
import 'package:zimbra_api/src/account/type/pref.dart';
import 'package:zimbra_api/src/account/type/prop.dart';
import 'package:zimbra_api/src/account/type/signature.dart';
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
      this.prefs = const <Pref>[],
      this.attrs = const <Attr>[],
      this.zimlets = const <AccountZimletInfo>[],
      this.props = const <Prop>[],
      this.identities = const <Identity>[],
      this.signatures = const <Signature>[],
      this.dataSources,
      this.childAccounts = const <ChildAccount>[],
      this.discoveredRights = const <DiscoverRightsInfo>[],
      this.soapURL,
      this.publicURL,
      this.changePasswordURL,
      this.adminURL,
      this.boshURL,
      this.isTrackingIMAP});

  factory GetInfoResponse.fromJson(Map<String, dynamic> json) {
    final response = GetInfoResponse(
        attachmentSizeLimit: json['attSizeLimit'],
        documentSizeLimit: json['docSizeLimit'],
        version: json['version'] != null ? json['version']['_content'] : null,
        accountId: json['id'] != null ? json['id']['_content'] : null,
        profileImageId: json['profileImageId'] != null ? json['profileImageId']['_content'] : null,
        accountName: json['name'] != null ? json['name']['_content'] : null,
        crumb: json['crumb'] != null ? json['crumb']['_content'] : null,
        lifetime: json['lifetime'] != null ? json['lifetime']['_content'] : null,
        adminDelegated: json['adminDelegated'] != null ? json['adminDelegated']['_content'] : null,
        restUrl: json['rest'] != null ? json['rest']['_content'] : null,
        quotaUsed: json['used'] != null ? json['used']['_content'] : null,
        previousSessionTime: json['prevSession'] != null ? json['prevSession']['_content'] : null,
        lastWriteAccessTime: json['accessed'] != null ? json['accessed']['_content'] : null,
        recentMessageCount: json['recent'] != null ? json['recent']['_content'] : null,
        cos: json['cos'] != null ? Cos.fromJson(json['cos']) : null,
        dataSources: json['dataSources'] != null ? AccountDataSources.fromJson(json['dataSources']) : null,
        soapURL: json['soapURL'] != null ? json['soapURL']['_content'] : null,
        publicURL: json['publicURL'] != null ? json['publicURL']['_content'] : null,
        changePasswordURL: json['changePasswordURL'] != null ? json['changePasswordURL']['_content'] : null,
        adminURL: json['adminURL'] != null ? json['adminURL']['_content'] : null,
        boshURL: json['boshURL'] != null ? json['boshURL']['_content'] : null,
        isTrackingIMAP: json['isTrackingIMAP'] != null ? json['isTrackingIMAP']['_content'] : null);

    if (json['prefs'] != null && json['prefs'] is Iterable) {
      final prefs = json['prefs']['pref'] as Iterable;
      for (final pref in prefs) {
        response.prefs.add(Pref.fromJson(pref));
      }
    }

    if (json['attrs'] != null && json['attrs'] is Iterable) {
      final attrs = json['attrs']['attr'] as Iterable;
      for (final attr in attrs) {
        response.attrs.add(Attr.fromJson(attr));
      }
    }

    if (json['zimlets'] != null && json['zimlets'] is Iterable) {
      final zimlets = json['zimlets']['zimlet'] as Iterable;
      for (final zimlet in zimlets) {
        response.zimlets.add(AccountZimletInfo.fromJson(zimlet));
      }
    }

    if (json['props'] != null && json['props'] is Iterable) {
      final props = json['props']['prop'] as Iterable;
      for (final prop in props) {
        response.props.add(Prop.fromJson(prop));
      }
    }

    if (json['identities'] != null && json['identities'] is Iterable) {
      final identities = json['identities']['identity'] as Iterable;
      for (final identity in identities) {
        response.identities.add(Identity.fromJson(identity));
      }
    }

    if (json['signatures'] != null && json['signatures'] is Iterable) {
      final signatures = json['signatures']['signature'] as Iterable;
      for (final signature in signatures) {
        response.signatures.add(Signature.fromJson(signature));
      }
    }

    if (json['childAccounts'] != null && json['childAccounts'] is Iterable) {
      final childAccounts = json['childAccounts']['childAccount'] as Iterable;
      for (final childAccount in childAccounts) {
        response.childAccounts.add(ChildAccount.fromJson(childAccount));
      }
    }

    if (json['rights'] != null && json['rights'] is Iterable) {
      final rights = json['rights']['targets'] as Iterable;
      for (final targets in rights) {
        response.discoveredRights.add(DiscoverRightsInfo.fromJson(targets));
      }
    }

    return response;
  }
}

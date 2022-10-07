// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/soap/api.dart';

import 'account/message.dart';
import 'account/type.dart';
import 'common/enum/account_by.dart';
import 'common/enum/distribution_list_subscribe_op.dart';
import 'common/enum/gal_search_type.dart';
import 'common/enum/member_of_selector.dart';
import 'common/type/account_selector.dart';
import 'common/type/cursor_info.dart';
import 'common/type/distribution_list_selector.dart';
import 'common/type/domain_selector.dart';
import 'common/type/grantee_chooser.dart';
import 'common/type/key_value_pair.dart';
import 'common/type/op_value.dart';

class AccountApi extends Api {
  bool get isAwesome => true;

  AccountApi(super.serviceHost);

  /// Authenticate for an account
  /// when specifying an account, one of <password> or <preauth> or <recoveryCode> must be specified. See preauth.txt for a discussion of preauth.
  /// An authToken can be passed instead of account/password/preauth to validate an existing auth token.
  /// If {verifyAccount}="1", <account> is required and the account in the auth token is compared to the named account.
  /// Mismatch results in auth failure.
  /// An external app that relies on ZCS for user identification can use this to test if the auth token provided by the user belongs to that user.
  /// If {verifyAccount}="0" (default), only the auth token is verified and any <account> element specified is ignored.
  Future<AuthResponse?> auth(
      {AccountSelector? account,
      String? password,
      String? recoveryCode,
      PreAuth? preauth,
      AuthToken? authToken,
      String? jwtToken,
      String? virtualHost,
      List<Pref> prefs = const <Pref>[],
      List<Attr> attrs = const <Attr>[],
      String? requestedSkin,
      bool? persistAuthTokenCookie,
      bool? csrfSupported,
      String? twoFactorCode,
      bool? deviceTrusted,
      String? trustedDeviceToken,
      String? deviceId,
      bool? generateDeviceId,
      String? tokenType}) {
    final request = AuthRequest(
        account: account,
        password: password,
        recoveryCode: recoveryCode,
        preauth: preauth,
        authToken: authToken,
        jwtToken: jwtToken,
        virtualHost: virtualHost,
        requestedSkin: requestedSkin,
        persistAuthTokenCookie: persistAuthTokenCookie,
        csrfSupported: csrfSupported,
        twoFactorCode: twoFactorCode,
        deviceTrusted: deviceTrusted,
        trustedDeviceToken: trustedDeviceToken,
        deviceId: deviceId,
        generateDeviceId: generateDeviceId,
        tokenType: tokenType,
        prefs: prefs,
        attrs: attrs);
    return invoke(request).then((json) => AuthEnvelope.fromJson(json).authBody.authResponse);
  }

  /// Authenticate by account name
  Future<AuthResponse?> authByAccountName(String name, String password) {
    final account = AccountSelector(AcccountBy.name, name);
    return auth(account: account, password: password);
  }

  /// Authenticate by account id
  Future<AuthResponse?> authByAccountId(String id, String password) {
    final account = AccountSelector(AcccountBy.id, id);
    return auth(account: account, password: password);
  }

  /// Authenticate by auth token
  Future<AuthResponse?> authByToken(String token) {
    final authToken = AuthToken(token);
    return auth(authToken: authToken);
  }

  /// Authenticate by preauth
  Future<AuthResponse?> authByPreauth(String name, String preauthKey) {
    return auth(preauth: PreAuth(AccountSelector(AcccountBy.name, name), preauthKey));
  }

  /// Perform an autocomplete for a name against the Global Address List
  /// The number of entries in the response is limited by Account/COS attribute zimbraContactAutoCompleteMaxResults with
  /// default value of 20.
  Future<AutoCompleteGalResponse?> autoCompleteGal(String name,
      {GalSearchType? type, bool? needCanExpand, String? galAccountId, int? limit}) {
    return invoke(AutoCompleteGalRequest(name, needCanExpand: needCanExpand, galAccountId: galAccountId, limit: limit))
        .then((json) => AutoCompleteGalEnvelope.fromJson(json).autoCompleteGalBody.autoCompleteGalResponse);
  }

  /// Change password
  Future<ChangePasswordResponse?> changePassword(AccountSelector account, String oldPassword, String newPassword,
      {String? virtualHost, bool? dryRun}) {
    return invoke(ChangePasswordRequest(account, oldPassword, newPassword, virtualHost: virtualHost, dryRun: dryRun))
        .then((json) => ChangePasswordEnvelope.fromJson(json).changePasswordBody.changePasswordResponse);
  }

  /// Check if the authed user has the specified right(s) on a target.
  Future<CheckRightsResponse?> checkRights({List<CheckRightsTargetSpec> targets = const <CheckRightsTargetSpec>[]}) {
    return invoke(CheckRightsRequest(targets: targets))
        .then((json) => CheckRightsEnvelope.fromJson(json).checkRightsBody.checkRightsResponse);
  }

  /// Get client info
  Future<ClientInfoResponse?> clientInfo(DomainSelector domain) {
    return invoke(ClientInfoRequest(domain))
        .then((json) => ClientInfoEnvelope.fromJson(json).clientInfoBody.clientInfoResponse);
  }

  /// Create a Distribution List
  /// authed account must have the privilege to create dist lists in the domain
  Future<CreateDistributionListResponse?> createDistributionList(String name,
      {bool? isDynamic, List<KeyValuePair> keyValuePairs = const <KeyValuePair>[]}) {
    return invoke(CreateDistributionListRequest(name, isDynamic: isDynamic, keyValuePairs: keyValuePairs)).then(
        (json) =>
            CreateDistributionListEnvelope.fromJson(json).createDistributionListBody.createDistributionListResponse);
  }

  /// Create an Identity
  /// Notes: Allowed attributes (see objectclass zimbraIdentity in zimbra.schema)
  Future<CreateIdentityResponse?> createIdentity(Identity identity) {
    return invoke(CreateIdentityRequest(identity))
        .then((json) => CreateIdentityEnvelope.fromJson(json).createIdentityBody.createIdentityResponse);
  }

  /// Create a signature.
  /// If an id is provided it will be honored as the id for the signature.
  /// CreateSignature will set account default signature to the signature being created
  /// if there is currently no default signature for the account.
  /// There can be at most one text/plain signatue and one text/html signature.
  Future<CreateSignatureResponse?> createSignature(Signature signature) {
    return invoke(CreateSignatureRequest(signature))
        .then((json) => CreateSignatureEnvelope.fromJson(json).createSignatureBody.createSignatureResponse);
  }

  /// Delete an Identity
  /// must specify either {name} or {id} attribute to identity
  Future<DeleteIdentityResponse?> deleteIdentity(NameId identity) {
    return invoke(DeleteIdentityRequest(identity))
        .then((json) => DeleteIdentityEnvelope.fromJson(json).deleteIdentityBody.deleteIdentityResponse);
  }

  /// Delete a signature
  /// must specify either {name} or {id} attribute to signature
  Future<DeleteSignatureResponse?> deleteSignature(NameId signature) {
    return invoke(DeleteSignatureRequest(signature))
        .then((json) => DeleteSignatureEnvelope.fromJson(json).deleteSignatureBody.deleteSignatureResponse);
  }

  /// Return all targets of the specified rights applicable to the requested account.
  /// Notes:
  /// 1. This call only discovers grants granted on the designated target type of the specified rights.
  ///    It does not return grants granted on target types the rights can inherit from.
  /// 2. For sendAs, sendOnBehalfOf, sendAsDistList, sendOnBehalfOfDistList rights, name attribute
  ///    is not returned on <target> elements.
  ///    Instead, addresses in the target entry's zimbraPrefAllowAddressForDelegatedSender are returned
  ///    in <e a="{email-address}"/> elements under the <target> element.
  ///    If zimbraPrefAllowAddressForDelegatedSender is not set on the target entry, the entry's primary
  ///    email address will be return in the only <e a="{email-address}"/> element under the <target> element.
  /// 3. For all other rights, name attribute is always returned on <target> elements,
  ///    no <e a="{email-address}"/> will be returned. name attribute contains the entry's primary name.
  Future<DiscoverRightsResponse?> discoverRights({List<String> rights = const <String>[]}) {
    return invoke(DiscoverRightsRequest(rights: rights))
        .then((json) => DiscoverRightsEnvelope.fromJson(json).discoverRightsBody.discoverRightsResponse);
  }

  /// Perform an action on a Distribution List
  /// Notes:
  ///   - Authorized account must be one of the list owners
  ///   - For owners/rights, only grants on the group itself will be modified,
  ///     grants on domain and globalgrant (from which the right can be inherited) will not be touched.
  ///     Only admins can modify grants on domains and globalgrant, owners of groups
  ///     can only modify grants on the group entry.
  Future<DistributionListActionResponse?> distributionListAction(
      DistributionListSelector dl, DistributionListAction action) {
    return invoke(DistributionListActionRequest(dl, action)).then((json) =>
        DistributionListActionEnvelope.fromJson(json).distributionListActionBody.distributionListActionResponse);
  }

  /// End the current session, removing it from all caches.
  /// Called when the browser app (or other session-using app) shuts down.
  /// Has no effect if called in a <nosession> context.
  Future<EndSessionResponse?> endSession(
      {bool? logoff, bool? clearAllSoapSessions, bool? excludeCurrentSession, String? sessionId}) {
    return invoke(EndSessionRequest(
            logoff: logoff,
            clearAllSoapSessions: clearAllSoapSessions,
            excludeCurrentSession: excludeCurrentSession,
            sessionId: sessionId))
        .then((json) => EndSessionEnvelope.fromJson(json).endSessionBody.endSessionResponse);
  }

  /// Returns groups the user is either a member or an owner of.
  /// Notes:
  ///   - isOwner is returned only if ownerOf on the request is 1 (true).
  ///   - isMember is returned only if memberOf on the request is not "none".
  Future<GetAccountDistributionListsResponse?> getAccountDistributionLists(
      {bool? ownerOf, MemberOfSelector? memberOf, String? attrs}) {
    return invoke(GetAccountDistributionListsRequest(ownerOf: ownerOf, memberOf: memberOf, attrs: attrs)).then((json) =>
        GetAccountDistributionListsEnvelope.fromJson(json)
            .getAccountDistributionListsBody
            .getAccountDistributionListsResponse);
  }

  /// Get information about an account
  Future<GetAccountInfoResponse?> getAccountInfo(AccountSelector account) {
    return invoke(GetAccountInfoRequest(account))
        .then((json) => GetAccountInfoEnvelope.fromJson(json).getAccountInfoBody.getAccountInfoResponse);
  }

  /// Returns all locales defined in the system.  This is the same list returned by
  /// java.util.Locale.getAvailableLocales(), sorted by display name (name attribute).
  Future<GetAllLocalesResponse?> getAllLocales() {
    return invoke(GetAllLocalesRequest())
        .then((json) => GetAllLocalesEnvelope.fromJson(json).getAllLocalesBody.getAllLocalesResponse);
  }

  /// Returns the known CSV formats that can be used for import and export of addressbook.
  Future<GetAvailableCsvFormatsResponse?> getAvailableCsvFormats() {
    return invoke(GetAvailableCsvFormatsRequest()).then((json) =>
        GetAvailableCsvFormatsEnvelope.fromJson(json).getAvailableCsvFormatsBody.getAvailableCsvFormatsResponse);
  }

  /// Get the intersection of all translated locales installed on the server and the list specified in zimbraAvailableLocale.
  /// The locale list in the response is sorted by display name (name attribute).
  Future<GetAvailableLocalesResponse?> getAvailableLocales() {
    return invoke(GetAvailableLocalesRequest())
        .then((json) => GetAvailableLocalesEnvelope.fromJson(json).getAvailableLocalesBody.getAvailableLocalesResponse);
  }

  /// Get the intersection of installed skins on the server and the list specified in the zimbraAvailableSkin on an account (or its CoS).
  /// If none is set in zimbraAvailableSkin, get the entire list of installed skins.
  /// The installed skin list is obtained by a directory scan of the designated location of skins on a server.
  Future<GetAvailableSkinsResponse?> getAvailableSkins() {
    return invoke(GetAvailableSkinsRequest())
        .then((json) => GetAvailableSkinsEnvelope.fromJson(json).getAvailableSkinsBody.getAvailableSkinsResponse);
  }

  /// Get the list of members of a distribution list.
  Future<GetDistributionListMembersResponse?> getDistributionListMembers(String name, {int? limit, int? offset}) {
    return invoke(GetDistributionListMembersRequest(name, limit: limit, offset: offset)).then((json) =>
        GetDistributionListMembersEnvelope.fromJson(json)
            .getDistributionListMembersBody
            .getDistributionListMembersResponse);
  }

  /// Get a distribution list, optionally with ownership information an granted rights.
  Future<GetDistributionListResponse?> getDistributionList(DistributionListSelector dl,
      {bool? needOwners, bool? needRights}) {
    return invoke(GetDistributionListRequest(dl, needOwners: needOwners, needRights: needRights))
        .then((json) => GetDistributionListEnvelope.fromJson(json).getDistributionListBody.getDistributionListResponse);
  }

  /// Get the identities for the authed account.
  Future<GetIdentitiesResponse?> getIdentities() {
    return invoke(GetIdentitiesRequest())
        .then((json) => GetIdentitiesEnvelope.fromJson(json).getIdentitiesBody.getIdentitiesResponse);
  }

  /// Get information about an account.
  /// By default, GetInfo returns all data; to limit the returned data, specify only the sections you want in the "sections" attr.
  Future<GetInfoResponse?> getInfo({String? sections, String? rights}) {
    return invoke(GetInfoRequest(sections: sections, rights: rights))
        .then((json) => GetInfoEnvelope.fromJson(json).getInfoBody.getInfoResponse);
  }

  /// Get OAuth consumers.
  Future<GetOAuthConsumersResponse?> getOAuthConsumers() {
    return invoke(GetOAuthConsumersRequest())
        .then((json) => GetOAuthConsumersEnvelope.fromJson(json).getOAuthConsumersBody.getOAuthConsumersResponse);
  }

  /// Get preferences for the authenticated account
  /// If no <pref> elements are provided, all known prefs are returned in the response.
  /// If <pref> elements are provided, only those prefs are returned in the response.
  Future<GetPrefsResponse?> getPrefs({List<Pref> prefs = const <Pref>[]}) {
    return invoke(GetPrefsRequest(prefs: prefs))
        .then((json) => GetPrefsEnvelope.fromJson(json).getPrefsBody.getPrefsResponse);
  }

  /// Get account level rights.
  /// If no <ace> elements are provided, all ACEs are returned in the response.
  /// If <ace> elements are provided, only those ACEs with specified rights are returned in the response.
  Future<GetRightsResponse?> getRights({List<Right> aces = const <Right>[]}) {
    return invoke(GetRightsRequest(aces: aces))
        .then((json) => GetRightsEnvelope.fromJson(json).getRightsBody.getRightsResponse);
  }

  /// Get information about published shares
  Future<GetShareInfoResponse?> getShareInfo(
      {GranteeChooser? grantee, AccountSelector? owner, bool? internal, bool? includeSelf}) {
    return invoke(GetShareInfoRequest(grantee: grantee, owner: owner, internal: internal, includeSelf: includeSelf))
        .then((json) => GetShareInfoEnvelope.fromJson(json).getShareInfoBody.getShareInfoResponse);
  }

  /// Get signatures associated with an account
  Future<GetSignaturesResponse?> getSignatures() {
    return invoke(GetSignaturesRequest())
        .then((json) => GetSignaturesEnvelope.fromJson(json).getSignaturesBody.getSignaturesResponse);
  }

  /// Get version information
  Future<GetVersionInfoResponse?> getVersionInfo() {
    return invoke(GetVersionInfoRequest())
        .then((json) => GetVersionInfoEnvelope.fromJson(json).getVersionInfoBody.getVersionInfoResponse);
  }

  /// Get the anti-spam WhiteList and BlackList addresses
  Future<GetWhiteBlackListResponse?> getWhiteBlackList() {
    return invoke(GetWhiteBlackListRequest())
        .then((json) => GetWhiteBlackListEnvelope.fromJson(json).getWhiteBlackListBody.getWhiteBlackListResponse);
  }

  /// Grant account level rights
  Future<GrantRightsResponse?> grantRights({List<AccountACEInfo> aces = const <AccountACEInfo>[]}) {
    return invoke(GrantRightsRequest(aces: aces))
        .then((json) => GrantRightsEnvelope.fromJson(json).grantRightsBody.grantRightsResponse);
  }

  /// Modify an identity
  Future<ModifyIdentityResponse?> modifyIdentity(Identity identity) {
    return invoke(ModifyIdentityRequest(identity))
        .then((json) => ModifyIdentityEnvelope.fromJson(json).modifyIdentityBody.modifyIdentityResponse);
  }

  /// Modify Preferences
  /// Notes:
  /// For multi-value prefs, just add the same attribute with 'n' different values
  /// You can also add/subtract single values to/from a multi-value pref by prefixing
  /// the preference name with a '+' or '-', respectively in the same way you do when using zmprov.
  Future<ModifyPrefsResponse?> modifyPrefs({List<Pref> prefs = const <Pref>[]}) {
    return invoke(ModifyPrefsRequest(prefs: prefs))
        .then((json) => ModifyPrefsEnvelope.fromJson(json).modifyPrefsBody.modifyPrefsResponse);
  }

  /// Modify properties related to zimlets
  Future<ModifyPropertiesResponse?> modifyProperties({List<Prop> props = const <Prop>[]}) {
    return invoke(ModifyPropertiesRequest(props: props))
        .then((json) => ModifyPropertiesEnvelope.fromJson(json).modifyPropertiesBody.modifyPropertiesResponse);
  }

  /// Change attributes of the given signature.
  /// Only the attributes specified in the request are modified.
  /// Note:
  /// The Server identifies the signature by id, if the name attribute is present
  /// and is different from the current name of the signature, the signature will be renamed.
  Future<ModifySignatureResponse?> modifySignature(Signature signature) {
    return invoke(ModifySignatureRequest(signature))
        .then((json) => ModifySignatureEnvelope.fromJson(json).modifySignatureBody.modifySignatureResponse);
  }

  /// Modify the anti-spam WhiteList and BlackList addresses
  Future<ModifyWhiteBlackListResponse?> modifyWhiteBlackList(
      {List<OpValue> whiteListEntries = const <OpValue>[], List<OpValue> blackListEntries = const <OpValue>[]}) {
    return invoke(ModifyWhiteBlackListRequest(whiteListEntries: whiteListEntries, blackListEntries: blackListEntries))
        .then((json) =>
            ModifyWhiteBlackListEnvelope.fromJson(json).modifyWhiteBlackListBody.modifyWhiteBlackListResponse);
  }

  /// Modify zimlet preferences
  Future<ModifyZimletPrefsResponse?> modifyZimletPrefs(
      {List<ModifyZimletPrefsSpec> zimlets = const <ModifyZimletPrefsSpec>[]}) {
    return invoke(ModifyZimletPrefsRequest(zimlets: zimlets))
        .then((json) => ModifyZimletPrefsEnvelope.fromJson(json).modifyZimletPrefsBody.modifyZimletPrefsResponse);
  }

  /// Reset password
  Future<ResetPasswordResponse?> resetPassword(String password) {
    return invoke(ResetPasswordRequest(password))
        .then((json) => ResetPasswordEnvelope.fromJson(json).resetPasswordBody.resetPasswordResponse);
  }

  /// Revoke OAuth consumer
  Future<RevokeOAuthConsumerResponse?> revokeOAuthConsumer(String accessToken) {
    return invoke(RevokeOAuthConsumerRequest(accessToken))
        .then((json) => RevokeOAuthConsumerEnvelope.fromJson(json).revokeOAuthConsumerBody.revokeOAuthConsumerResponse);
  }

  /// Revoke account level rights
  Future<RevokeRightsResponse?> revokeRights({List<AccountACEInfo> aces = const <AccountACEInfo>[]}) {
    return invoke(RevokeRightsRequest(aces: aces))
        .then((json) => RevokeRightsEnvelope.fromJson(json).revokeRightsBody.revokeRightsResponse);
  }

  /// Search Global Address List (GAL) for calendar resources
  /// "attrs" attribute - comma-separated list of attrs to return ("displayName", "zimbraId", "zimbraCalResType")
  Future<SearchCalendarResourcesResponse?> searchCalendarResources(
      {CursorInfo? cursor,
      EntrySearchFilterInfo? searchFilter,
      bool? quick,
      String? sortBy,
      int? limit,
      int? offset,
      String? locale,
      String? galAccountId,
      String? name,
      String? attrs}) {
    return invoke(SearchCalendarResourcesRequest(
            cursor: cursor,
            searchFilter: searchFilter,
            quick: quick,
            sortBy: sortBy,
            limit: limit,
            offset: offset,
            locale: locale,
            galAccountId: galAccountId,
            name: name,
            attrs: attrs))
        .then((json) =>
            SearchCalendarResourcesEnvelope.fromJson(json).searchCalendarResourcesBody.searchCalendarResourcesResponse);
  }

  /// Search Global Address List (GAL)
  Future<SearchGalResponse?> searchGal(
      {CursorInfo? cursor,
      EntrySearchFilterInfo? searchFilter,
      String? ref,
      String? name,
      GalSearchType? type,
      bool? needCanExpand,
      bool? needIsOwner,
      MemberOfSelector? needIsMember,
      bool? needSMIMECerts,
      bool? galAccountId,
      bool? quick,
      String? sortBy,
      int? limit,
      int? offset,
      String? locale}) {
    return invoke(SearchGalRequest(
            cursor: cursor,
            searchFilter: searchFilter,
            ref: ref,
            name: name,
            type: type,
            needCanExpand: needCanExpand,
            needIsOwner: needIsOwner,
            needIsMember: needIsMember,
            needSMIMECerts: needSMIMECerts,
            galAccountId: galAccountId,
            quick: quick,
            sortBy: sortBy,
            limit: limit,
            offset: offset,
            locale: locale))
        .then((json) => SearchGalEnvelope.fromJson(json).searchGalBody.searchGalResponse);
  }

  /// Subscribe to or unsubscribe from a distribution list
  Future<SubscribeDistributionListResponse?> subscribeDistributionList(DistributionListSelector dl,
      {DistributionListSubscribeOp op = DistributionListSubscribeOp.subscribe}) {
    return invoke(SubscribeDistributionListRequest(dl, op: op)).then((json) =>
        SubscribeDistributionListEnvelope.fromJson(json)
            .subscribeDistributionListBody
            .subscribeDistributionListResponse);
  }

  /// Synchronize with the Global Address List
  Future<SyncGalResponse?> syncGal({String? token, String? galAccountId, bool? idOnly, bool? getCount, int? limit}) {
    return invoke(
            SyncGalRequest(token: token, galAccountId: galAccountId, idOnly: idOnly, getCount: getCount, limit: limit))
        .then((json) => SyncGalEnvelope.fromJson(json).syncGalBody.syncGalResponse);
  }
}

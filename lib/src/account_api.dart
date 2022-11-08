// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'account/message.dart';
import 'account/type.dart';
import 'common/enum/account_by.dart';
import 'common/enum/distribution_list_subscribe_op.dart';
import 'common/enum/gal_search_type.dart';
import 'common/enum/member_of_selector.dart';
import 'common/soap/api.dart';
import 'common/type/account_selector.dart';
import 'common/type/cursor_info.dart';
import 'common/type/distribution_list_selector.dart';
import 'common/type/domain_selector.dart';
import 'common/type/grantee_chooser.dart';
import 'common/type/key_value_pair.dart';
import 'common/type/op_value.dart';

class AccountApi extends Api {
  AccountApi(super.serviceHost, {super.httpClientFactory});

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
      List<Pref> prefs = const [],
      List<Attr> attrs = const [],
      String? requestedSkin,
      bool? persistAuthTokenCookie,
      bool? csrfSupported,
      String? twoFactorCode,
      bool? deviceTrusted,
      String? trustedDeviceToken,
      String? deviceId,
      bool? generateDeviceId,
      String? tokenType}) {
    return invoke(
        AuthRequest(
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
          attrs: attrs,
        ),
        fromMap: (data) => AuthEnvelope.fromMap(data).body.response as AuthResponse?);
  }

  /// Authenticate by account name
  Future<AuthResponse?> authByAccountName(String name, String password) {
    return auth(account: AccountSelector(AccountBy.name, name), password: password);
  }

  /// Authenticate by account id
  Future<AuthResponse?> authByAccountId(String id, String password) {
    return auth(account: AccountSelector(AccountBy.id, id), password: password);
  }

  /// Authenticate by auth token
  Future<AuthResponse?> authByToken(String token) {
    return auth(authToken: AuthToken(token));
  }

  /// Authenticate by preauth
  Future<AuthResponse?> authByPreauth(String name, String preauthKey) {
    final account = AccountSelector(AccountBy.name, name);
    return auth(
      account: account,
      preauth: PreAuth(account, preauthKey, timestamp: DateTime.now().millisecondsSinceEpoch),
    );
  }

  /// Perform an autocomplete for a name against the Global Address List
  /// The number of entries in the response is limited by Account/COS attribute zimbraContactAutoCompleteMaxResults with
  /// default value of 20.
  Future<AutoCompleteGalResponse?> autoCompleteGal(String name,
      {GalSearchType? type, bool? needCanExpand, String? galAccountId, int? limit}) {
    return invoke(AutoCompleteGalRequest(name, needCanExpand: needCanExpand, galAccountId: galAccountId, limit: limit),
        fromMap: (data) => AutoCompleteGalEnvelope.fromMap(data).body.response as AutoCompleteGalResponse?);
  }

  /// Change password
  Future<ChangePasswordResponse?> changePassword(AccountSelector account, String oldPassword, String newPassword,
      {String? virtualHost, bool? dryRun}) {
    return invoke(ChangePasswordRequest(account, oldPassword, newPassword, virtualHost: virtualHost, dryRun: dryRun),
        fromMap: (data) => ChangePasswordEnvelope.fromMap(data).body.response as ChangePasswordResponse?);
  }

  /// Check if the authed user has the specified right(s) on a target.
  Future<CheckRightsResponse?> checkRights({List<CheckRightsTargetSpec> targets = const []}) {
    return invoke(CheckRightsRequest(targets: targets),
        fromMap: (data) => CheckRightsEnvelope.fromMap(data).body.response as CheckRightsResponse?);
  }

  /// Get client info
  Future<ClientInfoResponse?> clientInfo(DomainSelector domain) {
    return invoke(ClientInfoRequest(domain),
        fromMap: (data) => ClientInfoEnvelope.fromMap(data).body.response as ClientInfoResponse?);
  }

  /// Create a Distribution List
  /// authed account must have the privilege to create dist lists in the domain
  Future<CreateDistributionListResponse?> createDistributionList(String name,
      {bool? isDynamic, List<KeyValuePair> keyValuePairs = const []}) {
    return invoke(CreateDistributionListRequest(name, isDynamic: isDynamic, keyValuePairs: keyValuePairs),
        fromMap: (data) =>
            CreateDistributionListEnvelope.fromMap(data).body.response as CreateDistributionListResponse?);
  }

  /// Create an Identity
  /// Notes: Allowed attributes (see objectclass zimbraIdentity in zimbra.schema)
  Future<CreateIdentityResponse?> createIdentity(Identity identity) {
    return invoke(CreateIdentityRequest(identity),
        fromMap: (data) => CreateIdentityEnvelope.fromMap(data).body.response as CreateIdentityResponse?);
  }

  /// Create a signature.
  /// If an id is provided it will be honored as the id for the signature.
  /// CreateSignature will set account default signature to the signature being created
  /// if there is currently no default signature for the account.
  /// There can be at most one text/plain signatue and one text/html signature.
  Future<CreateSignatureResponse?> createSignature(Signature signature) {
    return invoke(CreateSignatureRequest(signature),
        fromMap: (data) => CreateSignatureEnvelope.fromMap(data).body.response as CreateSignatureResponse?);
  }

  /// Delete an Identity
  /// must specify either {name} or {id} attribute to identity
  Future<DeleteIdentityResponse?> deleteIdentity(NameId identity) {
    return invoke(DeleteIdentityRequest(identity),
        fromMap: (data) => DeleteIdentityEnvelope.fromMap(data).body.response as DeleteIdentityResponse?);
  }

  /// Delete a signature
  /// must specify either {name} or {id} attribute to signature
  Future<DeleteSignatureResponse?> deleteSignature(NameId signature) {
    return invoke(DeleteSignatureRequest(signature),
        fromMap: (data) => DeleteSignatureEnvelope.fromMap(data).body.response as DeleteSignatureResponse?);
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
  Future<DiscoverRightsResponse?> discoverRights({List<String> rights = const []}) {
    return invoke(DiscoverRightsRequest(rights: rights),
        fromMap: (data) => DiscoverRightsEnvelope.fromMap(data).body.response as DiscoverRightsResponse?);
  }

  /// Perform an action on a Distribution List
  /// Notes:
  ///   - Authorized account must be one of the list owners
  ///   - For owners/rights, only grants on the group itself will be modified,
  ///     grants on domain and globalgrant (from which the right can be inherited) will not be touched.
  ///     Only admins can modify grants on domains and globalgrant, owners of groups
  ///     can only modify grants on the group entry.
  Future<DistributionListActionResponse?> distributionListAction(
    DistributionListSelector dl,
    DistributionListAction action,
  ) {
    return invoke(
      DistributionListActionRequest(dl, action),
      fromMap: (data) => DistributionListActionEnvelope.fromMap(data).body.response as DistributionListActionResponse?,
    );
  }

  /// End the current session, removing it from all caches.
  /// Called when the browser app (or other session-using app) shuts down.
  /// Has no effect if called in a <nosession> context.
  Future<EndSessionResponse?> endSession(
      {bool? logoff, bool? clearAllSoapSessions, bool? excludeCurrentSession, String? sessionId}) {
    return invoke(
        EndSessionRequest(
          logoff: logoff,
          clearAllSoapSessions: clearAllSoapSessions,
          excludeCurrentSession: excludeCurrentSession,
          sessionId: sessionId,
        ),
        fromMap: (data) => EndSessionEnvelope.fromMap(data).body.response as EndSessionResponse?);
  }

  /// Returns groups the user is either a member or an owner of.
  /// Notes:
  ///   - isOwner is returned only if ownerOf on the request is 1 (true).
  ///   - isMember is returned only if memberOf on the request is not "none".
  Future<GetAccountDistributionListsResponse?> getAccountDistributionLists(
      {bool? ownerOf, MemberOfSelector? memberOf, String? attrs}) {
    return invoke(
      GetAccountDistributionListsRequest(
        ownerOf: ownerOf,
        memberOf: memberOf,
        attrs: attrs,
      ),
      fromMap: (data) =>
          GetAccountDistributionListsEnvelope.fromMap(data).body.response as GetAccountDistributionListsResponse?,
    );
  }

  /// Get information about an account
  Future<GetAccountInfoResponse?> getAccountInfo(AccountSelector account) {
    return invoke(GetAccountInfoRequest(account),
        fromMap: (data) => GetAccountInfoEnvelope.fromMap(data).body.response as GetAccountInfoResponse?);
  }

  /// Returns all locales defined in the system.  This is the same list returned by
  /// java.util.Locale.getAvailableLocales(), sorted by display name (name attribute).
  Future<GetAllLocalesResponse?> getAllLocales() {
    return invoke(GetAllLocalesRequest(),
        fromMap: (data) => GetAllLocalesEnvelope.fromMap(data).body.response as GetAllLocalesResponse?);
  }

  /// Returns the known CSV formats that can be used for import and export of addressbook.
  Future<GetAvailableCsvFormatsResponse?> getAvailableCsvFormats() {
    return invoke(GetAvailableCsvFormatsRequest(),
        fromMap: (data) =>
            GetAvailableCsvFormatsEnvelope.fromMap(data).body.response as GetAvailableCsvFormatsResponse?);
  }

  /// Get the intersection of all translated locales installed on the server and the list specified in zimbraAvailableLocale.
  /// The locale list in the response is sorted by display name (name attribute).
  Future<GetAvailableLocalesResponse?> getAvailableLocales() {
    return invoke(GetAvailableLocalesRequest(),
        fromMap: (data) => GetAvailableLocalesEnvelope.fromMap(data).body.response as GetAvailableLocalesResponse?);
  }

  /// Get the intersection of installed skins on the server and the list specified in the zimbraAvailableSkin on an account (or its CoS).
  /// If none is set in zimbraAvailableSkin, get the entire list of installed skins.
  /// The installed skin list is obtained by a directory scan of the designated location of skins on a server.
  Future<GetAvailableSkinsResponse?> getAvailableSkins() {
    return invoke(GetAvailableSkinsRequest(),
        fromMap: (data) => GetAvailableSkinsEnvelope.fromMap(data).body.response as GetAvailableSkinsResponse?);
  }

  /// Get the list of members of a distribution list.
  Future<GetDistributionListMembersResponse?> getDistributionListMembers(String dl, {int? limit, int? offset}) {
    return invoke(GetDistributionListMembersRequest(dl, limit: limit, offset: offset),
        fromMap: (data) =>
            GetDistributionListMembersEnvelope.fromMap(data).body.response as GetDistributionListMembersResponse?);
  }

  /// Get a distribution list, optionally with ownership information an granted rights.
  Future<GetDistributionListResponse?> getDistributionList(DistributionListSelector dl,
      {bool? needOwners, bool? needRights}) {
    return invoke(GetDistributionListRequest(dl, needOwners: needOwners, needRights: needRights),
        fromMap: (data) => GetDistributionListEnvelope.fromMap(data).body.response as GetDistributionListResponse?);
  }

  /// Get the identities for the authed account.
  Future<GetIdentitiesResponse?> getIdentities() {
    return invoke(GetIdentitiesRequest(),
        fromMap: (data) => GetIdentitiesEnvelope.fromMap(data).body.response as GetIdentitiesResponse?);
  }

  /// Get information about an account.
  /// By default, GetInfo returns all data; to limit the returned data, specify only the sections you want in the "sections" attr.
  Future<GetInfoResponse?> getInfo({String? sections, String? rights}) {
    return invoke(GetInfoRequest(sections: sections, rights: rights),
        fromMap: (data) => GetInfoEnvelope.fromMap(data).body.response as GetInfoResponse?);
  }

  /// Get OAuth consumers.
  Future<GetOAuthConsumersResponse?> getOAuthConsumers() {
    return invoke(GetOAuthConsumersRequest(),
        fromMap: (data) => GetOAuthConsumersEnvelope.fromMap(data).body.response as GetOAuthConsumersResponse?);
  }

  /// Get preferences for the authenticated account
  /// If no <pref> elements are provided, all known prefs are returned in the response.
  /// If <pref> elements are provided, only those prefs are returned in the response.
  Future<GetPrefsResponse?> getPrefs({List<Pref> prefs = const []}) {
    return invoke(GetPrefsRequest(prefs: prefs),
        fromMap: (data) => GetPrefsEnvelope.fromMap(data).body.response as GetPrefsResponse?);
  }

  /// Get account level rights.
  /// If no <ace> elements are provided, all ACEs are returned in the response.
  /// If <ace> elements are provided, only those ACEs with specified rights are returned in the response.
  Future<GetRightsResponse?> getRights({List<Right> aces = const []}) {
    return invoke(GetRightsRequest(aces: aces),
        fromMap: (data) => GetRightsEnvelope.fromMap(data).body.response as GetRightsResponse?);
  }

  /// Get information about published shares
  Future<GetShareInfoResponse?> getShareInfo(
      {GranteeChooser? grantee, AccountSelector? owner, bool? internal, bool? includeSelf}) {
    return invoke(GetShareInfoRequest(grantee: grantee, owner: owner, internal: internal, includeSelf: includeSelf),
        fromMap: (data) => GetShareInfoEnvelope.fromMap(data).body.response as GetShareInfoResponse?);
  }

  /// Get signatures associated with an account
  Future<GetSignaturesResponse?> getSignatures() {
    return invoke(GetSignaturesRequest(),
        fromMap: (data) => GetSignaturesEnvelope.fromMap(data).body.response as GetSignaturesResponse?);
  }

  /// Get version information
  Future<GetVersionInfoResponse?> getVersionInfo() {
    return invoke(GetVersionInfoRequest(),
        fromMap: (data) => GetVersionInfoEnvelope.fromMap(data).body.response as GetVersionInfoResponse?);
  }

  /// Get the anti-spam WhiteList and BlackList addresses
  Future<GetWhiteBlackListResponse?> getWhiteBlackList() {
    return invoke(GetWhiteBlackListRequest(),
        fromMap: (data) => GetWhiteBlackListEnvelope.fromMap(data).body.response as GetWhiteBlackListResponse?);
  }

  /// Grant account level rights
  Future<GrantRightsResponse?> grantRights({List<AccountACEInfo> aces = const []}) {
    return invoke(GrantRightsRequest(aces: aces),
        fromMap: (data) => GrantRightsEnvelope.fromMap(data).body.response as GrantRightsResponse?);
  }

  /// Modify an identity
  Future<ModifyIdentityResponse?> modifyIdentity(Identity identity) {
    return invoke(ModifyIdentityRequest(identity),
        fromMap: (data) => ModifyIdentityEnvelope.fromMap(data).body.response as ModifyIdentityResponse?);
  }

  /// Modify Preferences
  /// Notes:
  /// For multi-value prefs, just add the same attribute with 'n' different values
  /// You can also add/subtract single values to/from a multi-value pref by prefixing
  /// the preference name with a '+' or '-', respectively in the same way you do when using zmprov.
  Future<ModifyPrefsResponse?> modifyPrefs({List<Pref> prefs = const []}) {
    return invoke(ModifyPrefsRequest(prefs: prefs),
        fromMap: (data) => ModifyPrefsEnvelope.fromMap(data).body.response as ModifyPrefsResponse?);
  }

  /// Modify properties related to zimlets
  Future<ModifyPropertiesResponse?> modifyProperties({List<Prop> props = const []}) {
    return invoke(ModifyPropertiesRequest(props: props),
        fromMap: (data) => ModifyPropertiesEnvelope.fromMap(data).body.response as ModifyPropertiesResponse?);
  }

  /// Change attributes of the given signature.
  /// Only the attributes specified in the request are modified.
  /// Note:
  /// The Server identifies the signature by id, if the name attribute is present
  /// and is different from the current name of the signature, the signature will be renamed.
  Future<ModifySignatureResponse?> modifySignature(Signature signature) {
    return invoke(ModifySignatureRequest(signature),
        fromMap: (data) => ModifySignatureEnvelope.fromMap(data).body.response as ModifySignatureResponse?);
  }

  /// Modify the anti-spam WhiteList and BlackList addresses
  Future<ModifyWhiteBlackListResponse?> modifyWhiteBlackList(
      {List<OpValue> whiteListEntries = const [], List<OpValue> blackListEntries = const []}) {
    return invoke(ModifyWhiteBlackListRequest(whiteListEntries: whiteListEntries, blackListEntries: blackListEntries),
        fromMap: (data) => ModifyWhiteBlackListEnvelope.fromMap(data).body.response as ModifyWhiteBlackListResponse?);
  }

  /// Modify zimlet preferences
  Future<ModifyZimletPrefsResponse?> modifyZimletPrefs({List<ModifyZimletPrefsSpec> zimlets = const []}) {
    return invoke(ModifyZimletPrefsRequest(zimlets: zimlets),
        fromMap: (data) => ModifyZimletPrefsEnvelope.fromMap(data).body.response as ModifyZimletPrefsResponse?);
  }

  /// Reset password
  Future<ResetPasswordResponse?> resetPassword(String password) {
    return invoke(ResetPasswordRequest(password),
        fromMap: (data) => ResetPasswordEnvelope.fromMap(data).body.response as ResetPasswordResponse?);
  }

  /// Revoke OAuth consumer
  Future<RevokeOAuthConsumerResponse?> revokeOAuthConsumer(String accessToken) {
    return invoke(RevokeOAuthConsumerRequest(accessToken),
        fromMap: (data) => RevokeOAuthConsumerEnvelope.fromMap(data).body.response as RevokeOAuthConsumerResponse?);
  }

  /// Revoke account level rights
  Future<RevokeRightsResponse?> revokeRights({List<AccountACEInfo> aces = const []}) {
    return invoke(RevokeRightsRequest(aces: aces),
        fromMap: (data) => RevokeRightsEnvelope.fromMap(data).body.response as RevokeRightsResponse?);
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
    return invoke(
        SearchCalendarResourcesRequest(
          cursor: cursor,
          searchFilter: searchFilter,
          quick: quick,
          sortBy: sortBy,
          limit: limit,
          offset: offset,
          locale: locale,
          galAccountId: galAccountId,
          name: name,
          attrs: attrs,
        ),
        fromMap: (data) =>
            SearchCalendarResourcesEnvelope.fromMap(data).body.response as SearchCalendarResourcesResponse?);
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
      String? galAccountId,
      bool? quick,
      String? sortBy,
      int? limit,
      int? offset,
      String? locale}) {
    return invoke(
        SearchGalRequest(
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
          locale: locale,
        ),
        fromMap: (data) => SearchGalEnvelope.fromMap(data).body.response as SearchGalResponse?);
  }

  /// Subscribe to or unsubscribe from a distribution list
  Future<SubscribeDistributionListResponse?> subscribeDistributionList(DistributionListSelector dl,
      {DistributionListSubscribeOp op = DistributionListSubscribeOp.subscribe}) {
    return invoke(SubscribeDistributionListRequest(dl, op: op),
        fromMap: (data) =>
            SubscribeDistributionListEnvelope.fromMap(data).body.response as SubscribeDistributionListResponse?);
  }

  /// Synchronize with the Global Address List
  Future<SyncGalResponse?> syncGal({String? token, String? galAccountId, bool? idOnly, bool? getCount, int? limit}) {
    return invoke(
        SyncGalRequest(
          token: token,
          galAccountId: galAccountId,
          idOnly: idOnly,
          getCount: getCount,
          limit: limit,
        ),
        fromMap: (data) => SyncGalEnvelope.fromMap(data).body.response as SyncGalResponse?);
  }
}

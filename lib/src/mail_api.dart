// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'common/enum/browse_by.dart';
import 'common/enum/channel.dart';
import 'common/enum/gal_search_type.dart';
import 'common/enum/mail_item_type.dart';
import 'common/enum/msg_content.dart';
import 'common/enum/participation_status.dart';
import 'common/enum/recover_account_operation.dart';
import 'common/enum/recovery_account_operation.dart';
import 'common/enum/restore_resolve.dart';
import 'common/enum/result_mode.dart';
import 'common/enum/search_sort_by.dart';
import 'common/enum/share_action.dart';
import 'common/enum/verb_type.dart';
import 'common/enum/want_recips_setting.dart';
import 'common/type/attribute_name.dart';
import 'common/type/cursor_info.dart';
import 'common/type/id.dart';
import 'common/type/named_element.dart';
import 'common/type/section_attr.dart';
import 'common/type/wait_set_add_spec.dart';

import 'account_api.dart';
import 'mail/message.dart';
import 'mail/type.dart';

class MailApi extends AccountApi {
  MailApi(
    super.serviceHost, {
    super.httpClientFactory,
    super.authToken,
    super.targetAccount,
    super.sessionId,
    super.userAgentName,
    super.userAgentVersion,
  });

  /// Add an invite to an appointment.
  /// The invite corresponds to a VEVENT component.
  /// Based on the UID specified (required), a new appointment is created in the default calendar if necessary.
  /// If an appointment with the same UID exists, the appointment is updated with the new invite only
  /// if the invite is not outdated, according to the iCalendar sequencing rule
  /// (based on SEQUENCE, RECURRENCE-ID and DTSTAMP).
  Future<AddAppointmentInviteResponse?> addAppointmentInvite(Msg msg,
      {ParticipationStatus? partStat}) {
    return invoke(
      AddAppointmentInviteRequest(msg, partStat: partStat),
      fromMap: (data) => AddAppointmentInviteEnvelope.fromMap(data)
          .body
          .response as AddAppointmentInviteResponse?,
    );
  }

  /// Add a comment to the specified item.
  /// Currently comments can only be added to documents
  Future<AddCommentResponse?> addComment(AddedComment comment) {
    return invoke(
      AddCommentRequest(comment),
      fromMap: (data) =>
          AddCommentEnvelope.fromMap(data).body.response as AddCommentResponse?,
    );
  }

  /// Add a message
  Future<AddMsgResponse?> addMsg(AddMsgSpec msg, {bool? filterSent}) {
    return invoke(
      AddMsgRequest(msg, filterSent: filterSent),
      fromMap: (data) =>
          AddMsgEnvelope.fromMap(data).body.response as AddMsgResponse?,
    );
  }

  /// Add a task invite
  Future<AddTaskInviteResponse?> addTaskInvite(Msg msg,
      {ParticipationStatus? partStat}) {
    return invoke(
      AddTaskInviteRequest(msg, partStat: partStat),
      fromMap: (data) => AddTaskInviteEnvelope.fromMap(data).body.response
          as AddTaskInviteResponse?,
    );
  }

  /// Announce change of organizer
  Future<AnnounceOrganizerChangeResponse?> announceOrganizerChange(String id) {
    return invoke(
      AnnounceOrganizerChangeRequest(id),
      fromMap: (data) => AnnounceOrganizerChangeEnvelope.fromMap(data)
          .body
          .response as AnnounceOrganizerChangeResponse?,
    );
  }

  /// Applies one or more filter rules to messages specified by a comma-separated ID list,  or returned by a search query.
  /// One or the other can be specified, but not both.
  /// Returns the list of ids of existing messages that were affected.
  /// Note that redirect actions are ignored when applying filter rules to existing messages.
  Future<ApplyFilterRulesResponse?> applyFilterRules({
    List<NamedElement> filterRules = const [],
    IdsAttr? msgIds,
    String? query,
  }) {
    return invoke(
      ApplyFilterRulesRequest(
        filterRules: filterRules,
        msgIds: msgIds,
        query: query,
      ),
      fromMap: (data) => ApplyFilterRulesEnvelope.fromMap(data).body.response
          as ApplyFilterRulesResponse?,
    );
  }

  /// Applies one or more filter rules to messages specified by a comma-separated ID list,  or returned by a search query.
  /// One or the other can be specified, but not both.
  /// Returns the list of ids of existing messages that were affected.
  /// Note that redirect actions are ignored when applying filter rules to existing messages.
  Future<ApplyOutgoingFilterRulesResponse?> applyOutgoingFilterRules({
    List<NamedElement> filterRules = const [],
    IdsAttr? msgIds,
    String? query,
  }) {
    return invoke(
      ApplyOutgoingFilterRulesRequest(
        filterRules: filterRules,
        msgIds: msgIds,
        query: query,
      ),
      fromMap: (data) => ApplyOutgoingFilterRulesEnvelope.fromMap(data)
          .body
          .response as ApplyOutgoingFilterRulesResponse?,
    );
  }

  /// Auto complete
  Future<AutoCompleteResponse?> autoComplete(
    String name, {
    GalSearchType? type,
    bool? needCanExpand,
    String? folderList,
    bool? includeGal,
  }) {
    return invoke(
      AutoCompleteRequest(
        name,
        type: type,
        needCanExpand: needCanExpand,
        folderList: folderList,
        includeGal: includeGal,
      ),
      fromMap: (data) => AutoCompleteEnvelope.fromMap(data).body.response
          as AutoCompleteResponse?,
    );
  }

  /// Begin tracking IMAP
  Future<BeginTrackingIMAPResponse?> beginTrackingIMAP() {
    return invoke(
      BeginTrackingIMAPRequest(),
      fromMap: (data) => BeginTrackingIMAPEnvelope.fromMap(data).body.response
          as BeginTrackingIMAPResponse?,
    );
  }

  /// Resend a message
  /// Supports (f)rom, (t)o, (c)c, (b)cc, (s)ender "type" on <e> elements
  /// (these get mapped to Resent-From, Resent-To, Resent-CC, Resent-Bcc, Resent-Sender headers,
  /// which are prepended to copy of existing message)
  /// Aside from these prepended headers, message is reinjected verbatim
  Future<BounceMsgResponse?> bounceMsg(BounceMsgSpec msg) {
    return invoke(
      BounceMsgRequest(msg),
      fromMap: (data) =>
          BounceMsgEnvelope.fromMap(data).body.response as BounceMsgResponse?,
    );
  }

  /// Browse
  Future<BrowseResponse?> browse(BrowseBy browseBy, {String? regex, int? max}) {
    return invoke(
      BrowseRequest(browseBy, regex: regex, max: max),
      fromMap: (data) =>
          BrowseEnvelope.fromMap(data).body.response as BrowseResponse?,
    );
  }

  /// Cancel appointment
  /// NOTE: If canceling an exception, the original instance (ie the one the exception was "excepting")
  /// WILL NOT be restored when you cancel this exception.
  Future<CancelAppointmentResponse?> cancelAppointment({
    String? id,
    int? componentNum,
    int? modifiedSequence,
    int? revision,
    InstanceRecurIdInfo? instance,
    CalTZInfo? timezone,
    Msg? msg,
  }) {
    return invoke(
      CancelAppointmentRequest(
        id: id,
        componentNum: componentNum,
        modifiedSequence: modifiedSequence,
        revision: revision,
        instance: instance,
        timezone: timezone,
        msg: msg,
      ),
      fromMap: (data) => CancelAppointmentEnvelope.fromMap(data).body.response
          as CancelAppointmentResponse?,
    );
  }

  /// Cancel task request
  Future<CancelTaskResponse?> cancelTask({
    String? id,
    int? componentNum,
    int? modifiedSequence,
    int? revision,
    InstanceRecurIdInfo? instance,
    CalTZInfo? timezone,
    Msg? msg,
  }) {
    return invoke(
      CancelTaskRequest(
        id: id,
        componentNum: componentNum,
        modifiedSequence: modifiedSequence,
        revision: revision,
        instance: instance,
        timezone: timezone,
        msg: msg,
      ),
      fromMap: (data) =>
          CancelTaskEnvelope.fromMap(data).body.response as CancelTaskResponse?,
    );
  }

  /// Check if the authed user has the specified right(s) on a target.
  /// Note: to be deprecated in Zimbra 9.  Use zimbraAccount CheckRights instead.
  Future<CheckPermissionResponse?> checkPermission(TargetSpec target,
      {List<String> rights = const []}) {
    return invoke(
      CheckPermissionRequest(target, rights: rights),
      fromMap: (data) => CheckPermissionEnvelope.fromMap(data).body.response
          as CheckPermissionResponse?,
    );
  }

  /// Check conflicts in recurrence against list of users.
  /// Set {all} attribute to get all instances, even those without conflicts.
  /// By default only instances that have conflicts are returned.
  Future<CheckRecurConflictsResponse?> checkRecurConflicts({
    int? startTime,
    int? endTime,
    bool? allInstances,
    String? excludeUid,
    List<CalTZInfo> timezones = const [],
    List<ExpandedRecurrenceCancel> cancelComponents = const [],
    List<ExpandedRecurrenceInvite> inviteComponents = const [],
    List<ExpandedRecurrenceException> exceptComponents = const [],
    List<FreeBusyUserSpec> freebusyUsers = const [],
  }) {
    return invoke(
      CheckRecurConflictsRequest(
        startTime: startTime,
        endTime: endTime,
        allInstances: allInstances,
        excludeUid: excludeUid,
        timezones: timezones,
        cancelComponents: cancelComponents,
        inviteComponents: inviteComponents,
        exceptComponents: exceptComponents,
        freebusyUsers: freebusyUsers,
      ),
      fromMap: (data) => CheckRecurConflictsEnvelope.fromMap(data).body.response
          as CheckRecurConflictsResponse?,
    );
  }

  /// Check spelling.
  /// Suggested words are listed in decreasing order of their match score.
  /// The "available" attribute specifies whether the server-side spell checking interface is available or not.
  Future<CheckSpellingResponse?> checkSpelling({
    String? dictionary,
    String? ignoreList,
    String? text,
  }) {
    return invoke(
      CheckSpellingRequest(
        dictionary: dictionary,
        ignoreList: ignoreList,
        text: text,
      ),
      fromMap: (data) => CheckSpellingEnvelope.fromMap(data).body.response
          as CheckSpellingResponse?,
    );
  }

  /// Complete a task instance
  Future<CompleteTaskInstanceResponse?> completeTaskInstance(
    String id,
    DtTimeInfo exceptionId, {
    CalTZInfo? timezone,
  }) {
    return invoke(
      CompleteTaskInstanceRequest(id, exceptionId, timezone: timezone),
      fromMap: (data) => CompleteTaskInstanceEnvelope.fromMap(data)
          .body
          .response as CompleteTaskInstanceResponse?,
    );
  }

  /// Contact action
  Future<ContactActionResponse?> contactAction(ContactActionSelector action) {
    return invoke(
      ContactActionRequest(action),
      fromMap: (data) => ContactActionEnvelope.fromMap(data).body.response
          as ContactActionResponse?,
    );
  }

  /// Conv action
  Future<ConvActionResponse?> convAction(ConvActionSelector action) {
    return invoke(
      ConvActionRequest(action),
      fromMap: (data) =>
          ConvActionEnvelope.fromMap(data).body.response as ConvActionResponse?,
    );
  }

  /// Propose a new time/location.
  /// Sent by meeting attendee to organizer.
  /// The syntax is very similar to CreateAppointmentRequest.
  /// Should include an <inv> element which encodes an iCalendar COUNTER object
  Future<CounterAppointmentResponse?> counterAppointment({
    String? id,
    int? componentNum,
    int? modifiedSequence,
    int? revision,
    Msg? msg,
  }) {
    return invoke(
      CounterAppointmentRequest(
        id: id,
        componentNum: componentNum,
        modifiedSequence: modifiedSequence,
        revision: revision,
        msg: msg,
      ),
      fromMap: (data) => CounterAppointmentEnvelope.fromMap(data).body.response
          as CounterAppointmentResponse?,
    );
  }

  /// Create appointment exception.
  Future<CreateAppointmentExceptionResponse?> createAppointmentException({
    String? id,
    int? numComponents,
    int? modifiedSequence,
    int? revision,
    bool? echo,
    int? maxSize,
    bool? wantHtml,
    bool? neuter,
    bool? forceSend,
    Msg? msg,
  }) {
    return invoke(
      CreateAppointmentExceptionRequest(
        id: id,
        numComponents: numComponents,
        modifiedSequence: modifiedSequence,
        revision: revision,
        echo: echo,
        maxSize: maxSize,
        wantHtml: wantHtml,
        neuter: neuter,
        forceSend: forceSend,
        msg: msg,
      ),
      fromMap: (data) => CreateAppointmentExceptionEnvelope.fromMap(data)
          .body
          .response as CreateAppointmentExceptionResponse?,
    );
  }

  /// This is the API to create a new appointment, optionally sending out meeting onvitations to other people.
  Future<CreateAppointmentResponse?> createAppointment({
    bool? echo,
    int? maxSize,
    bool? wantHtml,
    bool? neuter,
    bool? forceSend,
    Msg? msg,
  }) {
    return invoke(
      CreateAppointmentRequest(
        echo: echo,
        maxSize: maxSize,
        wantHtml: wantHtml,
        neuter: neuter,
        forceSend: forceSend,
        msg: msg,
      ),
      fromMap: (data) => CreateAppointmentEnvelope.fromMap(data).body.response
          as CreateAppointmentResponse?,
    );
  }

  /// Create a contact
  Future<CreateContactResponse?> createContact(
    ContactSpec contact, {
    bool? verbose,
    bool? wantImapUid,
    bool? wantModifiedSequence,
  }) {
    return invoke(
      CreateContactRequest(
        contact,
        verbose: verbose,
        wantImapUid: wantImapUid,
        wantModifiedSequence: wantModifiedSequence,
      ),
      fromMap: (data) => CreateContactEnvelope.fromMap(data).body.response
          as CreateContactResponse?,
    );
  }

  /// Creates a data source that imports mail items into the specified folder,
  /// for example via the POP3 or IMAP protocols.
  /// Only one data source is allowed per request.
  Future<CreateDataSourceResponse?> createDataSource({
    MailImapDataSource? imapDataSource,
    MailPop3DataSource? pop3DataSource,
    MailCaldavDataSource? caldavDataSource,
    MailYabDataSource? yabDataSource,
    MailRssDataSource? rssDataSource,
    MailGalDataSource? galDataSource,
    MailCalDataSource? calDataSource,
    MailUnknownDataSource? unknownDataSource,
  }) {
    return invoke(
      CreateDataSourceRequest(
        imapDataSource: imapDataSource,
        pop3DataSource: pop3DataSource,
        caldavDataSource: caldavDataSource,
        yabDataSource: yabDataSource,
        rssDataSource: rssDataSource,
        galDataSource: galDataSource,
        calDataSource: calDataSource,
        unknownDataSource: unknownDataSource,
      ),
      fromMap: (data) => CreateDataSourceEnvelope.fromMap(data).body.response
          as CreateDataSourceResponse?,
    );
  }

  /// Create folder
  Future<CreateFolderResponse?> createFolder(NewFolderSpec folder) {
    return invoke(
      CreateFolderRequest(folder),
      fromMap: (data) => CreateFolderEnvelope.fromMap(data).body.response
          as CreateFolderResponse?,
    );
  }

  /// Create mountpoint
  Future<CreateMountpointResponse?> createMountpoint(
      NewMountpointSpec mountpoint) {
    return invoke(
      CreateMountpointRequest(mountpoint),
      fromMap: (data) => CreateMountpointEnvelope.fromMap(data).body.response
          as CreateMountpointResponse?,
    );
  }

  /// Create a note
  Future<CreateNoteResponse?> createNote(NewNoteSpec note) {
    return invoke(
      CreateNoteRequest(note),
      fromMap: (data) =>
          CreateNoteEnvelope.fromMap(data).body.response as CreateNoteResponse?,
    );
  }

  /// Create a search folder
  Future<CreateSearchFolderResponse?> createSearchFolder(
      NewSearchFolderSpec searchFolder) {
    return invoke(
      CreateSearchFolderRequest(searchFolder),
      fromMap: (data) => CreateSearchFolderEnvelope.fromMap(data).body.response
          as CreateSearchFolderResponse?,
    );
  }

  /// Create a tag
  Future<CreateTagResponse?> createTag(TagSpec tag) {
    return invoke(
      CreateTagRequest(tag),
      fromMap: (data) =>
          CreateTagEnvelope.fromMap(data).body.response as CreateTagResponse?,
    );
  }

  /// Create task exception.
  Future<CreateTaskExceptionResponse?> createTaskException({
    String? id,
    int? numComponents,
    int? modifiedSequence,
    int? revision,
    bool? echo,
    int? maxSize,
    bool? wantHtml,
    bool? neuter,
    bool? forceSend,
    Msg? msg,
  }) {
    return invoke(
      CreateTaskExceptionRequest(
        id: id,
        numComponents: numComponents,
        modifiedSequence: modifiedSequence,
        revision: revision,
        echo: echo,
        maxSize: maxSize,
        wantHtml: wantHtml,
        neuter: neuter,
        forceSend: forceSend,
        msg: msg,
      ),
      fromMap: (data) => CreateTaskExceptionEnvelope.fromMap(data).body.response
          as CreateTaskExceptionResponse?,
    );
  }

  /// This is the API to create a new task
  Future<CreateTaskResponse?> createTask({
    bool? echo,
    int? maxSize,
    bool? wantHtml,
    bool? neuter,
    bool? forceSend,
    Msg? msg,
  }) {
    return invoke(
      CreateTaskRequest(
        echo: echo,
        maxSize: maxSize,
        wantHtml: wantHtml,
        neuter: neuter,
        forceSend: forceSend,
        msg: msg,
      ),
      fromMap: (data) =>
          CreateTaskEnvelope.fromMap(data).body.response as CreateTaskResponse?,
    );
  }

  /// Create a waitset to listen for changes on one or more accounts
  /// Called once to initialize a WaitSet and to set its "default interest types"
  /// WaitSet: scalable mechanism for listening for changes to one or more accounts
  Future<CreateWaitSetResponse?> createWaitSet({
    String? defaultInterests,
    bool? allAccounts,
    List<WaitSetAddSpec> accounts = const [],
  }) {
    return invoke(
      CreateWaitSetRequest(
        defaultInterests: defaultInterests,
        allAccounts: allAccounts,
        accounts: accounts,
      ),
      fromMap: (data) => CreateWaitSetEnvelope.fromMap(data).body.response
          as CreateWaitSetResponse?,
    );
  }

  /// Decline a change proposal from an attendee.
  /// Sent by organizer to an attendee who has previously sent a COUNTER message.
  /// The syntax of the request is very similar to CreateAppointmentRequest.
  Future<DeclineCounterAppointmentResponse?> declineCounterAppointment(
      {Msg? msg}) {
    return invoke(
      DeclineCounterAppointmentRequest(msg: msg),
      fromMap: (data) => DeclineCounterAppointmentEnvelope.fromMap(data)
          .body
          .response as DeclineCounterAppointmentResponse?,
    );
  }

  /// Deletes the given data sources.
  /// The name or id of each data source must be specified.
  Future<DeleteDataSourceResponse?> deleteDataSource({
    List<DataSourceNameOrId> imapDataSources = const [],
    List<DataSourceNameOrId> pop3DataSources = const [],
    List<DataSourceNameOrId> caldavDataSources = const [],
    List<DataSourceNameOrId> yabDataSources = const [],
    List<DataSourceNameOrId> rssDataSources = const [],
    List<DataSourceNameOrId> galDataSources = const [],
    List<DataSourceNameOrId> calDataSources = const [],
    List<DataSourceNameOrId> unknownDataSources = const [],
  }) {
    return invoke(
      DeleteDataSourceRequest(
        imapDataSources: imapDataSources,
        pop3DataSources: pop3DataSources,
        caldavDataSources: caldavDataSources,
        yabDataSources: yabDataSources,
        rssDataSources: rssDataSources,
        galDataSources: galDataSources,
        calDataSources: caldavDataSources,
        unknownDataSources: unknownDataSources,
      ),
      fromMap: (data) => DeleteDataSourceEnvelope.fromMap(data).body.response
          as DeleteDataSourceResponse?,
    );
  }

  /// Use this to close out the waitset.
  /// Note that the server will automatically time out a wait set
  /// if there is no reference to it for (default of) 20 minutes.
  /// WaitSet: scalable mechanism for listening for changes to one or more accounts
  Future<DestroyWaitSetResponse?> destroyWaitSet(String waitSetId) {
    return invoke(
      DestroyWaitSetRequest(waitSetId),
      fromMap: (data) => DestroyWaitSetEnvelope.fromMap(data).body.response
          as DestroyWaitSetResponse?,
    );
  }

  /// Performs line by line diff of two revisions of a document then returns a list of <chunk> containing the result.
  /// Sections of text that are identical to both versions are indicated with disp="common".
  /// For each conflict the chunk will show disp="first", disp="second" or both.
  Future<DiffDocumentResponse?> diffDocument(DiffDocumentVersionSpec doc) {
    return invoke(
      DiffDocumentRequest(doc),
      fromMap: (data) => DiffDocumentEnvelope.fromMap(data).body.response
          as DiffDocumentResponse?,
    );
  }

  /// Dismiss calendar item alarm
  Future<DismissCalendarItemAlarmResponse?> dismissCalendarItemAlarm({
    List<DismissAlarm> apptAlarms = const [],
    List<DismissAlarm> taskAlarms = const [],
  }) {
    return invoke(
      DismissCalendarItemAlarmRequest(
        apptAlarms: apptAlarms,
        taskAlarms: taskAlarms,
      ),
      fromMap: (data) => DismissCalendarItemAlarmEnvelope.fromMap(data)
          .body
          .response as DismissCalendarItemAlarmResponse?,
    );
  }

  /// Empty dumpster
  Future<EmptyDumpsterResponse?> emptyDumpster() {
    return invoke(
      EmptyDumpsterRequest(),
      fromMap: (data) => EmptyDumpsterEnvelope.fromMap(data).body.response
          as EmptyDumpsterResponse?,
    );
  }

  /// Enable/disable reminders for shared appointments/tasks on a mountpoint
  Future<EnableSharedReminderResponse?> enableSharedReminder(
      SharedReminderMount mount) {
    return invoke(
      EnableSharedReminderRequest(mount),
      fromMap: (data) => EnableSharedReminderEnvelope.fromMap(data)
          .body
          .response as EnableSharedReminderResponse?,
    );
  }

  /// Expand recurrences
  Future<ExpandRecurResponse?> expandRecur(
    int startTime,
    int endTime, {
    List<CalTZInfo> timezones = const [],
    List<ExpandedRecurrenceInvite> inviteComponents = const [],
    List<ExpandedRecurrenceException> exceptComponents = const [],
    List<ExpandedRecurrenceCancel> cancelComponents = const [],
  }) {
    return invoke(
      ExpandRecurRequest(
        startTime,
        endTime,
        timezones: timezones,
        inviteComponents: inviteComponents,
        exceptComponents: exceptComponents,
        cancelComponents: cancelComponents,
      ),
      fromMap: (data) => ExpandRecurEnvelope.fromMap(data).body.response
          as ExpandRecurResponse?,
    );
  }

  /// Export contacts
  Future<ExportContactsResponse?> exportContacts(
    String contentType, {
    String? folderId,
    String? csvFormat,
    String? csvLocale,
    String? csvDelimiter,
  }) {
    return invoke(
      ExportContactsRequest(
        contentType,
        folderId: folderId,
        csvFormat: csvFormat,
        csvLocale: csvLocale,
        csvDelimiter: csvDelimiter,
      ),
      fromMap: (data) => ExportContactsEnvelope.fromMap(data).body.response
          as ExportContactsResponse?,
    );
  }

  /// Perform an action on a folder
  ///
  /// Actions:
  ///   <action op="read" id="{list}"/>
  ///     - mark all items in the folder as read
  ///
  ///   <action op="delete" id="{list}"/>
  ///     - hard-delete the folder, all items in the folder, and all the folder's subfolders
  ///
  ///   <action op="empty" id="{list}" [recusive="{delete-subfolders}"]/>
  ///     - hard-delete all items in the folder (and all the folder's subfolders if "recursive" is set)
  ///
  ///   <action op="rename" id="{list}" name="{new-name}" [l="{new-folder}"]/>
  ///     - change the folder's name (and optionally location);
  ///       if {new-name} begins with '/', the folder is moved to the new path and any missing path elements are created
  ///
  ///   <action op="move" id="{list}" l="{new-folder}"/>
  ///     - move the folder to be a child of {target-folder}
  ///
  ///   <action op="trash" id="{list}"/>
  ///     - move the folder to the Trash, marking all contents as read and
  ///       renaming the folder if a folder by that name is already present in the Trash
  ///
  ///   <action op="color" id="{list}" color="{new-color} rgb="{new-color-in-rgb}"/>
  ///     - see ItemActionRequest
  ///
  ///   <action op="grant" id="{list}">
  ///     <grant perm="..." gt="..." zid="..." [expiry="{millis-since-epoch}"] [d="..."] [key="..."]/>
  ///   </action>
  ///     - add the <grant> object to the folder
  ///
  ///   <action op="!grant" id="{list}" zid="{grantee-zimbra-id}"/>
  ///     - revoke access from {grantee-zimbra-id}
  ///         (you can use "00000000-0000-0000-0000-000000000000" to revoke acces granted to "all"
  ///         or use "99999999-9999-9999-9999-999999999999" to revoke acces granted to "pub" )
  ///
  ///   <action op="revokeorphangrants" id="{folder-id}" zid="{grantee-zimbra-id}" gt="{grantee-type}"/>
  ///     - revoke orphan grants on the folder hierarchy granted to the grantee specified by zid and gt
  ///       "orphan grant" is a grant whose grantee object is deleted/non-existing.  Server will throw
  ///       INVALID_REQUEST if zid points to an existing object,
  ///       Only supported if gt is usr|grp|cos|dom; otherwise server will throw INVALID_REQUEST.
  ///
  ///   <action op="url" id="{list}" url="{target-url}" [excludeFreeBusy="{exclude-free-busy-bool}"]/>
  ///     - set the synchronization url on the folder to {target-url}, empty the folder, and\
  ///       synchronize the folder's contents to the remote feed, also sets {exclude-free-busy-bool}
  ///
  ///   <action op="sync" id="{list}"/>
  ///     - synchronize the folder's contents to the remote feed specified by the folder's {url}
  ///
  ///   <action op="import" id="{list}" url="{target-url}"/>
  ///     - add the contents to the remote feed at {target-url} to the folder [1-time action]
  ///
  ///   <action op="fb" id="{list}" excludeFreeBusy="{exclude-free-busy-bool}"/>
  ///     - set the excludeFreeBusy bool for this folder (must specify {exclude-free-busy-bool})
  ///
  ///   <action op="[!]check" id="{list}"/>
  ///     - set or unset the "checked" state of the folder in the UI
  ///
  ///   <action op="[!]syncon" id="{list}"/>
  ///     - set or unset the "sync" flag of the folder to sync a local folder with a remote source
  ///
  ///   <action op="[!]disableactivesync" id="{list}"/>
  ///     - If set, disable access to the folder via activesync.
  ///       Note: Only works for user folders, doesn't have any effect on system folders.
  ///
  ///   <action op="webofflinesyncdays" id="{list}" numDays="{web-offline-sync-days}/>
  ///     - set the number of days for which web client would sync folder data for offline use
  ///       {web-offline-sync-days} must not be greater than value of zimbraWebClientOfflineSyncMaxDays account attribute
  ///
  ///   <action op="update" id="{list}" [f="{new-flags}"] [name="{new-name}"]
  ///                          [l="{target-folder}"] [color="{new-color}"] [view="{new-view}"]>
  ///     [<acl><grant .../>*</acl>]
  ///   </action>
  ///     - do several operations at once:
  ///           name="{new-name}"        to change the folder's name
  ///           l="{target-folder}"      to change the folder's location
  ///           color="{new-color}"      to set the folder's color
  ///           view="{new-view}"        to change folder's default view (useful for migration)
  ///           f="{new-flags}"          to change the folder's exclude free/(b)usy, checked (#), and
  ///                                    IMAP subscribed (*) state
  ///           <acl><grant ...>*</acl>  to replace the folder's existing ACL with a new ACL
  ///
  ///     {list} = on input, list of folders to act on, on output, list of folders that were acted on;
  ///              list may only have 1 element for actions empty, sync, fb, check, !check, url, import, grant,
  ///              !grant, revokeorphangrants, !flag, !tag, syncon, !syncon, retentionpolicy
  ///
  /// output of "grant" action includes the zimbra id the rights were granted on
  ///
  /// note that "delete", "empty", "rename", "move", "color", "update" can be used on search folders as well as standard folders
  Future<FolderActionResponse?> folderAction(FolderActionSelector action) {
    return invoke(
      FolderActionRequest(action),
      fromMap: (data) => FolderActionEnvelope.fromMap(data).body.response
          as FolderActionResponse?,
    );
  }

  /// Used by an attendee to forward an appointment invite email to another user who is not already an attendee.
  /// To forward an appointment item, use ForwardAppointmentRequest instead.
  Future<ForwardAppointmentInviteResponse?> forwardAppointmentInvite(
      {String? id, Msg? msg}) {
    return invoke(
      ForwardAppointmentInviteRequest(id: id, msg: msg),
      fromMap: (data) => ForwardAppointmentInviteEnvelope.fromMap(data)
          .body
          .response as ForwardAppointmentInviteResponse?,
    );
  }

  /// Used by an attendee to forward an instance or entire appointment to another user who is not already an attendee.
  Future<ForwardAppointmentResponse?> forwardAppointment({
    String? id,
    DtTimeInfo? exceptionId,
    CalTZInfo? timezone,
    Msg? msg,
  }) {
    return invoke(
      ForwardAppointmentRequest(
        id: id,
        exceptionId: exceptionId,
        timezone: timezone,
        msg: msg,
      ),
      fromMap: (data) => ForwardAppointmentEnvelope.fromMap(data).body.response
          as ForwardAppointmentResponse?,
    );
  }

  /// Ajax client can use this request to ask the server for help in generating a proper, globally unique UUID.
  Future<GenerateUUIDResponse?> generateUUID() {
    return invoke(
      GenerateUUIDRequest(),
      fromMap: (data) => GenerateUUIDEnvelope.fromMap(data).body.response
          as GenerateUUIDResponse?,
    );
  }

  /// Get appointment.
  /// Returns the metadata info for each invite that makes up this appointment.
  Future<GetAppointmentResponse?> getAppointment({
    String? uid,
    String? id,
    bool? sync,
    bool? includeContent,
    bool? includeInvites,
  }) {
    return invoke(
      GetAppointmentRequest(
        uid: uid,
        id: id,
        sync: sync,
        includeContent: includeContent,
        includeInvites: includeInvites,
      ),
      fromMap: (data) => GetAppointmentEnvelope.fromMap(data).body.response
          as GetAppointmentResponse?,
    );
  }

  /// Get appointment summaries
  Future<GetApptSummariesResponse?> getApptSummaries(
    int startTime,
    int endTime, {
    String? folderId,
  }) {
    return invoke(
      GetApptSummariesRequest(
        startTime,
        endTime,
        folderId: folderId,
      ),
      fromMap: (data) => GetApptSummariesEnvelope.fromMap(data).body.response
          as GetApptSummariesResponse?,
    );
  }

  /// Get calendar item summaries
  Future<GetCalendarItemSummariesResponse?> getCalendarItemSummaries(
    int startTime,
    int endTime, {
    String? folderId,
  }) {
    return invoke(
      GetCalendarItemSummariesRequest(
        startTime,
        endTime,
        folderId: folderId,
      ),
      fromMap: (data) => GetCalendarItemSummariesEnvelope.fromMap(data)
          .body
          .response as GetCalendarItemSummariesResponse?,
    );
  }

  /// Get comments
  Future<GetCommentsResponse?> getComments(ParentId comment) {
    return invoke(
      GetCommentsRequest(comment),
      fromMap: (data) => GetCommentsEnvelope.fromMap(data).body.response
          as GetCommentsResponse?,
    );
  }

  /// Get list of available contact backups
  Future<GetContactBackupListResponse?> getContactBackupList() {
    return invoke(
      GetContactBackupListRequest(),
      fromMap: (data) => GetContactBackupListEnvelope.fromMap(data)
          .body
          .response as GetContactBackupListResponse?,
    );
  }

  /// Get contacts
  /// Contact group members are returned as <m> elements.
  /// If derefGroupMember is not set, group members are returned in the order they were inserted in the group.
  /// If derefGroupMember is set, group members are returned ordered by the "key" of member.
  /// Key is:
  /// - for contact ref (type="C"): the fileAs field of the Contact
  /// - for GAL ref (type="G"): email address of the GAL entry
  /// - for inlined member (type="I"): the value
  ///
  /// Contact group members are returned as sub-elements of <m>.
  /// If for any(transient or permanent) reason a member cannot be dereferenced, then there will be no sub-element under <m>.
  Future<GetContactsResponse?> getContacts({
    bool? sync,
    String? folderId,
    String? sortBy,
    bool? derefGroupMember,
    bool? includeMemberOf,
    bool? returnHiddenAttrs,
    bool? returnCertInfo,
    bool? wantImapUid,
    int? maxMembers,
    List<AttributeName> attributes = const [],
    List<AttributeName> memberAttributes = const [],
    List<Id> contacts = const [],
  }) {
    return invoke(
      GetContactsRequest(
        sync: sync,
        folderId: folderId,
        sortBy: sortBy,
        derefGroupMember: derefGroupMember,
        includeMemberOf: includeMemberOf,
        returnHiddenAttrs: returnHiddenAttrs,
        returnCertInfo: returnCertInfo,
        wantImapUid: wantImapUid,
        maxMembers: maxMembers,
        attributes: attributes,
        memberAttributes: memberAttributes,
        contacts: contacts,
      ),
      fromMap: (data) => GetContactsEnvelope.fromMap(data).body.response
          as GetContactsResponse?,
    );
  }

  /// Get conversation
  ///
  /// GetConvRequest gets information about the 1 conversation named by id's value.
  /// It will return exactly 1 conversation element.
  ///
  /// If fetch="1|all" is included, the full expanded message structure is inlined for the first (or for all) messages in the conversation.
  /// If fetch="{item-id}", only the message with the given {item-id} is expanded inline.
  ///
  /// if headers are requested, any matching headers are inlined into the response (not available when raw="1")
  Future<GetConvResponse?> getConv(ConversationSpec conversation) {
    return invoke(
      GetConvRequest(conversation),
      fromMap: (data) =>
          GetConvEnvelope.fromMap(data).body.response as GetConvResponse?,
    );
  }

  /// Get custom metadata
  Future<GetCustomMetadataResponse?> getCustomMetadata(SectionAttr metadata,
      {String? id}) {
    return invoke(
      GetCustomMetadataRequest(metadata, id: id),
      fromMap: (data) => GetCustomMetadataEnvelope.fromMap(data).body.response
          as GetCustomMetadataResponse?,
    );
  }

  /// Returns all data sources defined for the given mailbox.
  /// For each data source, every attribute value is returned except password.
  Future<GetDataSourcesResponse?> getDataSources() {
    return invoke(
      GetDataSourcesRequest(),
      fromMap: (data) => GetDataSourcesEnvelope.fromMap(data).body.response
          as GetDataSourcesResponse?,
    );
  }

  /// Get data source usage
  Future<GetDataSourceUsageResponse?> getDataSourceUsage() {
    return invoke(
      GetDataSourceUsageRequest(),
      fromMap: (data) => GetDataSourceUsageEnvelope.fromMap(data).body.response
          as GetDataSourceUsageResponse?,
    );
  }

  /// Returns the effective permissions of the specified folder
  Future<GetEffectiveFolderPermsResponse?> getEffectiveFolderPerms(
      FolderSpec folder) {
    return invoke(
      GetEffectiveFolderPermsRequest(folder),
      fromMap: (data) => GetEffectiveFolderPermsEnvelope.fromMap(data)
          .body
          .response as GetEffectiveFolderPermsResponse?,
    );
  }

  /// Get filter rules
  Future<GetFilterRulesResponse?> getFilterRules() {
    return invoke(
      GetFilterRulesRequest(),
      fromMap: (data) => GetFilterRulesEnvelope.fromMap(data).body.response
          as GetFilterRulesResponse?,
    );
  }

  /// Get folder
  ///
  /// A {base-folder-id}, a {base-folder-uuid} or a {fully-qualified-path} can optionally be specified in the folder element;
  /// if none is present, the descent of the folder hierarchy begins at the mailbox's root folder (id 1).
  ///
  /// If {fully-qualified-path} is present and {base-folder-id} or {base-folder-uuid} is also present,
  /// the path is treated as relative to the folder that was specified by id/uuid.
  /// {base-folder-id} is ignored if {base-folder-uuid} is present.
  Future<GetFolderResponse?> getFolder(
    GetFolderSpec folder, {
    bool? isVisible,
    bool? needGranteeName,
    String? viewConstraint,
    int? treeDepth,
    bool? traverseMountpoints,
  }) {
    return invoke(
      GetFolderRequest(
        folder,
        isVisible: isVisible,
        needGranteeName: needGranteeName,
        viewConstraint: viewConstraint,
        treeDepth: treeDepth,
        traverseMountpoints: traverseMountpoints,
      ),
      fromMap: (data) =>
          GetFolderEnvelope.fromMap(data).body.response as GetFolderResponse?,
    );
  }

  /// Get Free/Busy information.
  /// For freebusyUsers listed using uid,id or name attributes, f/b search will be done for all calendar folders.
  /// To view free/busy for a single folder in a particular account, use <usr>
  Future<GetFreeBusyResponse?> getFreeBusy(
    int startTime,
    int endTime, {
    String? uid,
    String? id,
    String? name,
    String? excludeUid,
    List<FreeBusyUserSpec> freebusyUsers = const [],
  }) {
    return invoke(
      GetFreeBusyRequest(
        startTime,
        endTime,
        uid: uid,
        id: id,
        name: name,
        excludeUid: excludeUid,
        freebusyUsers: freebusyUsers,
      ),
      fromMap: (data) => GetFreeBusyEnvelope.fromMap(data).body.response
          as GetFreeBusyResponse?,
    );
  }

  /// Retrieve the unparsed (but XML-encoded) iCalendar data for an Invite
  /// This is intended for interfacing with 3rd party programs
  /// If <id> attribute specified, gets the iCalendar representation for one invite
  /// If <id> attribute is not specified, then start/end MUST be, Calendar data is returned for entire specified range
  Future<GetICalResponse?> getICal({String? id, int? startTime, int? endTime}) {
    return invoke(
      GetICalRequest(
        id: id,
        startTime: startTime,
        endTime: endTime,
      ),
      fromMap: (data) =>
          GetICalEnvelope.fromMap(data).body.response as GetICalResponse?,
    );
  }

  /// Return the count of recent items in the specified folder
  Future<GetIMAPRecentCutoffResponse?> getIMAPRecentCutoff(String id) {
    return invoke(
      GetIMAPRecentCutoffRequest(id),
      fromMap: (data) => GetIMAPRecentCutoffEnvelope.fromMap(data).body.response
          as GetIMAPRecentCutoffResponse?,
    );
  }

  /// Return the count of recent items in the specified folder
  Future<GetIMAPRecentResponse?> getIMAPRecent(String id) {
    return invoke(
      GetIMAPRecentRequest(id),
      fromMap: (data) => GetIMAPRecentEnvelope.fromMap(data).body.response
          as GetIMAPRecentResponse?,
    );
  }

  /// Returns current import status for all data sources.  Status values for a data source
  /// Status values for a data source are reinitialized when either (a)
  /// another import process is startedor (b) when the server is restarted.
  /// If import has not run yet, the success and error attributes are not specified in the response.
  Future<GetImportStatusResponse?> getImportStatus() {
    return invoke(
      GetImportStatusRequest(),
      fromMap: (data) => GetImportStatusEnvelope.fromMap(data).body.response
          as GetImportStatusResponse?,
    );
  }

  /// Get item
  /// A successful GetItemResponse will contain a single element appropriate for the type of the requested item
  /// if there is no matching item, a fault containing the code mail.NO_SUCH_ITEM is returned
  Future<GetItemResponse?> getItem(ItemSpec item) {
    return invoke(
      GetItemRequest(item),
      fromMap: (data) =>
          GetItemEnvelope.fromMap(data).body.response as GetItemResponse?,
    );
  }

  /// Returns the last ID assigned to an item successfully created in the mailbox
  Future<GetLastItemIdInMailboxResponse?> getLastItemIdInMailbox() {
    return invoke(
      GetLastItemIdInMailboxRequest(),
      fromMap: (data) => GetLastItemIdInMailboxEnvelope.fromMap(data)
          .body
          .response as GetLastItemIdInMailboxResponse?,
    );
  }

  /// Get mailbox metadata
  Future<GetMailboxMetadataResponse?> getMailboxMetadata(SectionAttr metadata) {
    return invoke(
      GetMailboxMetadataRequest(metadata),
      fromMap: (data) => GetMailboxMetadataEnvelope.fromMap(data).body.response
          as GetMailboxMetadataResponse?,
    );
  }

  /// Get information needed for Mini Calendar.
  /// Date is returned if there is at least one appointment on that date.
  /// The date computation uses the requesting (authenticated) account's time zone,
  /// not the time zone of the account that owns the calendar folder.
  Future<GetMiniCalResponse?> getMiniCal(
    int startTime,
    int endTime, {
    List<Id> folders = const [],
    CalTZInfo? timezone,
  }) {
    return invoke(
      GetMiniCalRequest(
        startTime,
        endTime,
        folders: folders,
        timezone: timezone,
      ),
      fromMap: (data) =>
          GetMiniCalEnvelope.fromMap(data).body.response as GetMiniCalResponse?,
    );
  }

  /// Returns the IDs of all items modified since a given change number
  Future<GetModifiedItemsIDsResponse?> getModifiedItemsIDs(
      int folderId, int modSeq) {
    return invoke(
      GetModifiedItemsIDsRequest(folderId, modSeq),
      fromMap: (data) => GetModifiedItemsIDsEnvelope.fromMap(data).body.response
          as GetModifiedItemsIDsResponse?,
    );
  }

  /// Get message metadata
  Future<GetMsgMetadataResponse?> getMsgMetadata(IdsAttr msgIds) {
    return invoke(
      GetMsgMetadataRequest(msgIds),
      fromMap: (data) => GetMsgMetadataEnvelope.fromMap(data).body.response
          as GetMsgMetadataResponse?,
    );
  }

  /// Get message
  Future<GetMsgResponse?> getMsg(MsgSpec msg) {
    return invoke(
      GetMsgRequest(msg),
      fromMap: (data) =>
          GetMsgEnvelope.fromMap(data).body.response as GetMsgResponse?,
    );
  }

  /// Get note
  Future<GetNoteResponse?> getNote(Id note) {
    return invoke(
      GetNoteRequest(note),
      fromMap: (data) =>
          GetNoteEnvelope.fromMap(data).body.response as GetNoteResponse?,
    );
  }

  /// Get outgoing filter rules
  Future<GetOutgoingFilterRulesResponse?> getOutgoingFilterRules() {
    return invoke(
      GetOutgoingFilterRulesRequest(),
      fromMap: (data) => GetOutgoingFilterRulesEnvelope.fromMap(data)
          .body
          .response as GetOutgoingFilterRulesResponse?,
    );
  }

  /// If no <ace> elements are provided, all ACEs are returned in the response.
  /// If <ace> elements are provided, only those ACEs with specified rights are returned in the response.
  /// Note: to be deprecated in Zimbra 9.  Use zimbraAccount GetRights instead.
  Future<GetPermissionResponse?> getPermission({List<Right> aces = const []}) {
    return invoke(
      GetPermissionRequest(aces: aces),
      fromMap: (data) => GetPermissionEnvelope.fromMap(data).body.response
          as GetPermissionResponse?,
    );
  }

  /// Retrieve the recurrence definition of an appointment
  Future<GetRecurResponse?> getRecur(String id) {
    return invoke(
      GetRecurRequest(id),
      fromMap: (data) =>
          GetRecurEnvelope.fromMap(data).body.response as GetRecurResponse?,
    );
  }

  /// Get all search folders
  Future<GetSearchFolderResponse?> getSearchFolder() {
    return invoke(
      GetSearchFolderRequest(),
      fromMap: (data) => GetSearchFolderEnvelope.fromMap(data).body.response
          as GetSearchFolderResponse?,
    );
  }

  /// Get share notifications
  Future<GetShareNotificationsResponse?> getShareNotifications() {
    return invoke(
      GetShareNotificationsRequest(),
      fromMap: (data) => GetShareNotificationsEnvelope.fromMap(data)
          .body
          .response as GetShareNotificationsResponse?,
    );
  }

  /// Returns the list of dictionaries that can be used for spell checking.
  Future<GetSpellDictionariesResponse?> getSpellDictionaries() {
    return invoke(
      GetSpellDictionariesRequest(),
      fromMap: (data) => GetSpellDictionariesEnvelope.fromMap(data)
          .body
          .response as GetSpellDictionariesResponse?,
    );
  }

  /// Get system retention policy
  Future<GetSystemRetentionPolicyResponse?> getSystemRetentionPolicy() {
    return invoke(
      GetSystemRetentionPolicyRequest(),
      fromMap: (data) => GetSystemRetentionPolicyEnvelope.fromMap(data)
          .body
          .response as GetSystemRetentionPolicyResponse?,
    );
  }

  /// Get information about tags
  Future<GetTagResponse?> getTag() {
    return invoke(
      GetTagRequest(),
      fromMap: (data) =>
          GetTagEnvelope.fromMap(data).body.response as GetTagResponse?,
    );
  }

  /// Get task
  /// Similar to GetAppointmentRequest/GetAppointmentResponse
  Future<GetTaskResponse?> getTask({
    String? uid,
    String? id,
    bool? sync,
    bool? includeContent,
    bool? includeInvites,
  }) {
    return invoke(
      GetTaskRequest(
        uid: uid,
        id: id,
        sync: sync,
        includeContent: includeContent,
        includeInvites: includeInvites,
      ),
      fromMap: (data) =>
          GetTaskEnvelope.fromMap(data).body.response as GetTaskResponse?,
    );
  }

  /// Get task summaries
  Future<GetTaskSummariesResponse?> getTaskSummaries(
    int startTime,
    int endTime, {
    String? folderId,
  }) {
    return invoke(
      GetTaskSummariesRequest(
        startTime,
        endTime,
        folderId: folderId,
      ),
      fromMap: (data) => GetTaskSummariesEnvelope.fromMap(data).body.response
          as GetTaskSummariesResponse?,
    );
  }

  /// User's working hours within the given time range are expressed in a similar format to the format used for GetFreeBusy.
  /// Working hours are indicated as free, non-working hours as unavailable/out of office
  /// The entire time range is marked as unknown if there was an error determining the working hours,
  Future<GetWorkingHoursResponse?> getWorkingHours(
    int startTime,
    int endTime, {
    String? id,
    String? name,
  }) {
    return invoke(
      GetWorkingHoursRequest(
        startTime,
        endTime,
        id: id,
        name: name,
      ),
      fromMap: (data) => GetWorkingHoursEnvelope.fromMap(data).body.response
          as GetWorkingHoursResponse?,
    );
  }

  /// Get Yahoo Auth Token
  Future<GetYahooAuthTokenResponse?> getYahooAuthToken(
      String user, String password) {
    return invoke(
      GetYahooAuthTokenRequest(user, password),
      fromMap: (data) => GetYahooAuthTokenEnvelope.fromMap(data).body.response
          as GetYahooAuthTokenResponse?,
    );
  }

  /// Get Yahoo cookie
  Future<GetYahooCookieResponse?> getYahooCookie(String user) {
    return invoke(
      GetYahooCookieRequest(user),
      fromMap: (data) => GetYahooCookieEnvelope.fromMap(data).body.response
          as GetYahooCookieResponse?,
    );
  }

  /// Grant account level permissions
  /// GrantPermissionResponse returns permissions that are successfully granted.
  /// Note: to be deprecated in Zimbra 9.  Use zimbraAccount GrantRights instead.
  Future<GrantPermissionResponse?> grantPermission(List<AccountACEinfo> aces) {
    return invoke(
      GrantPermissionRequest(aces),
      fromMap: (data) => GrantPermissionEnvelope.fromMap(data).body.response
          as GrantPermissionResponse?,
    );
  }

  /// Do an iCalendar reply
  Future<ICalReplyResponse?> iCalReply(String ical) {
    return invoke(
      ICalReplyRequest(ical),
      fromMap: (data) =>
          ICalReplyEnvelope.fromMap(data).body.response as ICalReplyResponse?,
    );
  }

  /// Return the count of recent items in the specified folder
  Future<IMAPCopyResponse?> imapCopy(
      String ids, MailItemType type, int folder) {
    return invoke(
      IMAPCopyRequest(ids, type, folder),
      fromMap: (data) =>
          IMAPCopyEnvelope.fromMap(data).body.response as IMAPCopyResponse?,
    );
  }

  /// Import appointments
  Future<ImportAppointmentsResponse?> importAppointments(
    ContentSpec content, {
    String contentType = 'text/calendar',
    String? folderId,
  }) {
    return invoke(
      ImportAppointmentsRequest(
        content,
        contentType: contentType,
        folderId: folderId,
      ),
      fromMap: (data) => ImportAppointmentsEnvelope.fromMap(data).body.response
          as ImportAppointmentsResponse?,
    );
  }

  /// Import contacts
  Future<ImportContactsResponse?> importContacts(
    Content content, {
    String contentType = 'text/csv',
    String? folderId,
    String? csvFormat,
    String? csvLocale,
  }) {
    return invoke(
      ImportContactsRequest(
        content,
        contentType: contentType,
        folderId: folderId,
        csvFormat: csvFormat,
        csvLocale: csvLocale,
      ),
      fromMap: (data) => ImportContactsEnvelope.fromMap(data).body.response
          as ImportContactsResponse?,
    );
  }

  /// Triggers the specified data sources to kick off their import processes.
  /// Data import runs asynchronously, so the response immediately returns.
  /// Status of an import can be queried via the <GetImportStatusRequest> message.
  /// If the server receives an <ImportDataRequest> while an import is already running for a given data source,
  /// the second request is ignored.
  Future<ImportDataResponse?> importData({
    List<DataSourceNameOrId> imapDataSources = const [],
    List<DataSourceNameOrId> pop3DataSources = const [],
    List<DataSourceNameOrId> caldavDataSources = const [],
    List<DataSourceNameOrId> yabDataSources = const [],
    List<DataSourceNameOrId> rssDataSources = const [],
    List<DataSourceNameOrId> galDataSources = const [],
    List<DataSourceNameOrId> calDataSources = const [],
    List<DataSourceNameOrId> unknownDataSources = const [],
  }) {
    return invoke(
      ImportDataRequest(
        imapDataSources: imapDataSources,
        pop3DataSources: pop3DataSources,
        caldavDataSources: caldavDataSources,
        yabDataSources: yabDataSources,
        rssDataSources: rssDataSources,
        galDataSources: galDataSources,
        calDataSources: calDataSources,
        unknownDataSources: unknownDataSources,
      ),
      fromMap: (data) =>
          ImportDataEnvelope.fromMap(data).body.response as ImportDataResponse?,
    );
  }

  /// Invalidate reminder device
  Future<InvalidateReminderDeviceResponse?> invalidateReminderDevice(
      String address) {
    return invoke(
      InvalidateReminderDeviceRequest(address),
      fromMap: (data) => InvalidateReminderDeviceEnvelope.fromMap(data)
          .body
          .response as InvalidateReminderDeviceResponse?,
    );
  }

  /// Perform an action on an item
  Future<ItemActionResponse?> itemAction(ActionSelector action) {
    return invoke(
      ItemActionRequest(action),
      fromMap: (data) =>
          ItemActionEnvelope.fromMap(data).body.response as ItemActionResponse?,
    );
  }

  /// Returns {num} number of revisions starting from {version} of the requested document.
  /// {num} defaults to 1. {version} defaults to the current version.
  /// Documents that have multiple revisions have the flag "/", which indicates that the document is versioned.
  Future<ListDocumentRevisionsResponse?> listDocumentRevisions(
      ListDocumentRevisionsSpec doc) {
    return invoke(
      ListDocumentRevisionsRequest(doc),
      fromMap: (data) => ListDocumentRevisionsEnvelope.fromMap(data)
          .body
          .response as ListDocumentRevisionsResponse?,
    );
  }

  /// Return a list of subscribed folder names
  Future<ListIMAPSubscriptionsResponse?> listIMAPSubscriptions() {
    return invoke(
      ListIMAPSubscriptionsRequest(),
      fromMap: (data) => ListIMAPSubscriptionsEnvelope.fromMap(data)
          .body
          .response as ListIMAPSubscriptionsResponse?,
    );
  }

  /// Changed sequence of fetched version.
  /// Used for conflict detection.
  /// By setting this, the request indicates which version of the appointment it is attempting to modify.
  /// If the appointment was updated on the server between the fetch and modify,
  /// an INVITE_OUT_OF_DATE exception will be thrown.
  Future<ModifyAppointmentResponse?> modifyAppointment({
    String? id,
    int? componentNum,
    int? modifiedSequence,
    int? revision,
    bool? echo,
    int? maxSize,
    bool? wantHtml,
    bool? neuter,
    bool? forceSend,
    Msg? msg,
  }) {
    return invoke(
      ModifyAppointmentRequest(
        id: id,
        componentNum: componentNum,
        modifiedSequence: modifiedSequence,
        revision: revision,
        echo: echo,
        maxSize: maxSize,
        wantHtml: wantHtml,
        neuter: neuter,
        forceSend: forceSend,
        msg: msg,
      ),
      fromMap: (data) => ModifyAppointmentEnvelope.fromMap(data).body.response
          as ModifyAppointmentResponse?,
    );
  }

  /// Modify contact
  /// When modifying tags, all specified tags are set and all others are unset.
  /// If tn="{tag-names}" is NOT specified then any existing tags will remain set.
  Future<ModifyContactResponse?> modifyContact(
    ModifyContactSpec contact, {
    bool? replace,
    bool? verbose,
    bool? wantImapUid,
    bool? wantModifiedSequence,
  }) {
    return invoke(
      ModifyContactRequest(
        contact,
        replace: replace,
        verbose: verbose,
        wantImapUid: wantImapUid,
        wantModifiedSequence: wantModifiedSequence,
      ),
      fromMap: (data) => ModifyContactEnvelope.fromMap(data).body.response
          as ModifyContactResponse?,
    );
  }

  /// Changes attributes of the given data source.
  /// Only the attributes specified in the request are modified.
  /// If the username, host or leaveOnServer settings are modified, the server wipes out saved state for this data source.
  /// As a result, any previously downloaded messages that are still stored on the remote server will be downloaded again.
  Future<ModifyDataSourceResponse?> modifyDataSource({
    MailImapDataSource? imapDataSource,
    MailPop3DataSource? pop3DataSource,
    MailCaldavDataSource? caldavDataSource,
    MailYabDataSource? yabDataSource,
    MailRssDataSource? rssDataSource,
    MailGalDataSource? galDataSource,
    MailCalDataSource? calDataSource,
    MailUnknownDataSource? unknownDataSource,
  }) {
    return invoke(
      ModifyDataSourceRequest(
        imapDataSource: imapDataSource,
        pop3DataSource: pop3DataSource,
        caldavDataSource: caldavDataSource,
        yabDataSource: yabDataSource,
        rssDataSource: rssDataSource,
        galDataSource: galDataSource,
        calDataSource: calDataSource,
        unknownDataSource: unknownDataSource,
      ),
      fromMap: (data) => ModifyDataSourceEnvelope.fromMap(data).body.response
          as ModifyDataSourceResponse?,
    );
  }

  /// Modify filter rules
  Future<ModifyFilterRulesResponse?> modifyFilterRules(
      {List<FilterRule> filterRules = const []}) {
    return invoke(
      ModifyFilterRulesRequest(filterRules),
      fromMap: (data) => ModifyFilterRulesEnvelope.fromMap(data).body.response
          as ModifyFilterRulesResponse?,
    );
  }

  /// Modify mailbox metadata
  /// - Modify request must contain one or more key/value pairs
  /// - Existing keys' values will be replaced by new values
  /// - Empty or null value will remove a key
  /// - New keys can be added
  Future<ModifyMailboxMetadataResponse?> modifyMailboxMetadata(
      MailCustomMetadata metadata) {
    return invoke(
      ModifyMailboxMetadataRequest(metadata),
      fromMap: (data) => ModifyMailboxMetadataEnvelope.fromMap(data)
          .body
          .response as ModifyMailboxMetadataResponse?,
    );
  }

  /// Modify outgoing filter rules
  Future<ModifyOutgoingFilterRulesResponse?> modifyOutgoingFilterRules(
      {List<FilterRule> filterRules = const []}) {
    return invoke(
      ModifyOutgoingFilterRulesRequest(filterRules),
      fromMap: (data) => ModifyOutgoingFilterRulesEnvelope.fromMap(data)
          .body
          .response as ModifyOutgoingFilterRulesResponse?,
    );
  }

  /// Modify profile image
  Future<ModifyProfileImageResponse?> modifyProfileImage(
      {String? uploadId, String? imageB64Data}) {
    return invoke(
      ModifyProfileImageRequest(
        uploadId: uploadId,
        imageB64Data: imageB64Data,
      ),
      fromMap: (data) => ModifyProfileImageEnvelope.fromMap(data).body.response
          as ModifyProfileImageResponse?,
    );
  }

  /// Modify search folder
  Future<ModifySearchFolderResponse?> modifySearchFolder(
      ModifySearchFolderSpec searchFolder) {
    return invoke(
      ModifySearchFolderRequest(searchFolder),
      fromMap: (data) => ModifySearchFolderEnvelope.fromMap(data).body.response
          as ModifySearchFolderResponse?,
    );
  }

  Future<ModifyTaskResponse?> modifyTask({
    String? id,
    int? componentNum,
    int? modifiedSequence,
    int? revision,
    bool? echo,
    int? maxSize,
    bool? wantHtml,
    bool? neuter,
    bool? forceSend,
    Msg? msg,
  }) {
    return invoke(
      ModifyTaskRequest(
        id: id,
        componentNum: componentNum,
        modifiedSequence: modifiedSequence,
        revision: revision,
        echo: echo,
        maxSize: maxSize,
        wantHtml: wantHtml,
        neuter: neuter,
        forceSend: forceSend,
        msg: msg,
      ),
      fromMap: (data) =>
          ModifyTaskEnvelope.fromMap(data).body.response as ModifyTaskResponse?,
    );
  }

  /// Perform an action on a message
  /// For op="update", caller can specify any or all of:
  /// l="{folder}", name="{name}", color="{color}", tn="{tag-names}", f="{flags}".
  /// For op="!spam", can optionally specify a destination folder
  Future<MsgActionResponse?> msgAction(ActionSelector action) {
    return invoke(
      MsgActionRequest(action),
      fromMap: (data) =>
          MsgActionEnvelope.fromMap(data).body.response as MsgActionResponse?,
    );
  }

  /// A request that does nothing and always returns nothing. Used to keep a session alive,
  /// and return any pending notifications.
  ///
  /// If "wait" is set, and if the current session allows them, this request will block until there are new notifications
  /// for the client.  Note that the soap envelope must reference an existing session that has notifications enabled, and
  /// the notification sequencing number should be specified.
  ///
  /// If "wait" is set, the caller can specify whether notifications on delegate sessions will cause the operation to
  /// return.  If "delegate" is unset, delegate mailbox notifications will be ignored.  "delegate" is set by default.
  ///
  /// Some clients (notably browsers) have a global-limit on the number of outstanding sockets...in situations with two
  /// App Instances connected to one Zimbra Server, the browser app my appear to 'hang' if two app sessions attempt to do
  /// a blocking-NoOp simultaneously.  Since the apps are completely separate in the browser, it is impossible for the
  /// apps to coordinate with each other -- therefore the 'limitToOneBlocked' setting is exposed by the server.  If
  /// specified, the server will only allow a given user to have one single waiting-NoOp on the server at a time, it will
  /// complete (with waitDisallowed set) any existing limited hanging NoOpRequests when a new request comes in.
  ///
  /// The server may reply with a "waitDisallowed" attribute on response to a request with wait set.  If "waitDisallowed"
  /// is set, then blocking-NoOpRequests (ie requests with wait set) are <b>not</b> allowed by the server right now, and
  /// the client should stop attempting them.
  ///
  /// The client may specify a custom timeout-length for their request if they know something about the particular
  /// underlying network.  The server may or may not honor this request (depending on server configured max/min values:
  /// see LocalConfig variables zimbra_noop_default_timeout, zimbra_noop_min_timeout and zimbra_noop_max_timeout)
  Future<NoOpResponse?> noOp({
    bool? wait,
    bool? includeDelegates,
    bool? enforceLimit,
    int? timeout,
  }) {
    return invoke(
      NoOpRequest(
        wait: wait,
        includeDelegates: includeDelegates,
        enforceLimit: enforceLimit,
        timeout: timeout,
      ),
      fromMap: (data) =>
          NoOpEnvelope.fromMap(data).body.response as NoOpResponse?,
    );
  }

  /// Perform an action on an note
  Future<NoteActionResponse?> noteAction(NoteActionSelector action) {
    return invoke(
      NoteActionRequest(action),
      fromMap: (data) =>
          NoteActionEnvelope.fromMap(data).body.response as NoteActionResponse?,
    );
  }

  /// Open IMAP folder
  Future<OpenIMAPFolderResponse?> openIMAPFolder(
    String folderId,
    int limit, {
    ImapCursorInfo? cursor,
  }) {
    return invoke(
      OpenIMAPFolderRequest(
        folderId,
        limit,
        cursor: cursor,
      ),
      fromMap: (data) => OpenIMAPFolderEnvelope.fromMap(data).body.response
          as OpenIMAPFolderResponse?,
    );
  }

  /// Purge revision
  Future<PurgeRevisionResponse?> purgeRevision(PurgeRevisionSpec revision) {
    return invoke(
      PurgeRevisionRequest(revision),
      fromMap: (data) => PurgeRevisionEnvelope.fromMap(data).body.response
          as PurgeRevisionResponse?,
    );
  }

  /// Perform an action on the contact ranking table
  Future<RankingActionResponse?> rankingAction(RankingActionSpec action) {
    return invoke(
      RankingActionRequest(action),
      fromMap: (data) => RankingActionEnvelope.fromMap(data).body.response
          as RankingActionResponse?,
    );
  }

  /// Record that an IMAP client has seen all the messages in this folder as they are at this time.
  /// This is used to determine which messages are considered by IMAP to be RECENT.
  /// This is achieved by invoking Mailbox::recordImapSession for the specified folder
  Future<RecordIMAPSessionResponse?> recordIMAPSession(String folderId) {
    return invoke(
      RecordIMAPSessionRequest(folderId),
      fromMap: (data) => RecordIMAPSessionEnvelope.fromMap(data).body.response
          as RecordIMAPSessionResponse?,
    );
  }

  /// Recover account
  Future<RecoverAccountResponse?> recoverAccount(
    String email,
    RecoverAccountOperation operation, {
    Channel? channel,
  }) {
    return invoke(
      RecoverAccountRequest(
        email,
        operation,
        channel: channel,
      ),
      fromMap: (data) => RecoverAccountEnvelope.fromMap(data).body.response
          as RecoverAccountResponse?,
    );
  }

  /// Remove attachments from a message body
  /// NOTE: that this operation is effectively a create and a delete, and thus the message's item ID will change
  Future<RemoveAttachmentsResponse?> removeAttachments(MsgPartIds msg) {
    return invoke(
      RemoveAttachmentsRequest(msg),
      fromMap: (data) => RemoveAttachmentsEnvelope.fromMap(data).body.response
          as RemoveAttachmentsResponse?,
    );
  }

  /// Resets the mailbox's "recent message count" to 0.
  /// A message is considered "recent" if:
  /// - (a) it's not a draft or a sent message, and
  /// - (b) it was added since the last write operation associated with any SOAP session.
  Future<ResetRecentMessageCountResponse?> resetRecentMessageCount() {
    return invoke(
      ResetRecentMessageCountRequest(),
      fromMap: (data) => ResetRecentMessageCountEnvelope.fromMap(data)
          .body
          .response as ResetRecentMessageCountResponse?,
    );
  }

  /// Restore contacts
  Future<RestoreContactsResponse?> restoreContacts(String fileName,
      {RestoreResolve? resolve}) {
    return invoke(
      RestoreContactsRequest(fileName, resolve: resolve),
      fromMap: (data) => RestoreContactsEnvelope.fromMap(data).body.response
          as RestoreContactsResponse?,
    );
  }

  /// Revoke account level permissions
  /// RevokePermissionResponse returns permissions that are successfully revoked.
  /// Note: to be deprecated in Zimbra 9. Use zimbraAccount RevokeRights instead.
  Future<RevokePermissionResponse?> revokePermission(
      {List<AccountACEinfo> aces = const []}) {
    return invoke(
      RevokePermissionRequest(aces),
      fromMap: (data) => RevokePermissionEnvelope.fromMap(data).body.response
          as RevokePermissionResponse?,
    );
  }

  /// Save document
  ///
  /// One mechanism for Creating and updating a Document is:
  /// - Use FileUploadServlet to upload the document
  /// - Call SaveDocumentRequest using the upload-id returned from FileUploadServlet.
  ///
  /// A Document represents a file.  A file can be created by uploading to FileUploadServlet.  Or it can refer to an
  /// attachment of an existing message.
  ///
  /// Documents are versioned.  The server maintains the metadata of each version, such as by who and when the version
  /// was edited, and the fragment.
  ///
  /// When updating an existing Document, the client must supply the id of Document, and the last known version of the
  /// document in the 'ver' attribute.  This is used to prevent blindly overwriting someone else's change made after
  /// the version this update was based upon.  The update will succeed only when the last known version supplied by the
  /// client matches the current version of the item identified by item-id.
  ///
  /// Saving a new document, as opposed to adding a revision of existing document, should leave the id and ver fields
  /// empty in the request.  Then the server checks and see if the named document already exists, if so returns an error.
  ///
  /// The request should contain either an <upload> element or a <msg> element, but not both.
  /// When <upload> is used, the document should first be uploaded to FileUploadServlet, and then use the
  /// upload-id from the FileUploadResponse.
  ///
  /// When <m> is used, the document is retrieved from an existing message in the mailbox, identified by the
  /// msg-id and part-id.  The content of the document can be inlined in the <content> element.
  /// The content can come from another document / revision specified in the <doc> sub element.
  Future<SaveDocumentResponse?> saveDocument(DocumentSpec doc) {
    return invoke(
      SaveDocumentRequest(doc),
      fromMap: (data) => SaveDocumentEnvelope.fromMap(data).body.response
          as SaveDocumentResponse?,
    );
  }

  /// Save draft
  /// - Only allowed one top-level <mp> but can nest <mp>s within if multipart/* on reply/forward.
  ///   Set origid on <m> element and set rt to "r" or "w", respectively.
  /// - Can optionally set identity-id to specify the identity being used to compose the message.  If updating an
  ///   existing draft, set "id" attr on <m> element.
  /// - Can refer to parts of existing draft in <attach> block
  /// - Drafts default to the Drafts folder
  /// - Setting folder/tags/flags/color occurs after the draft is created/updated, and if it fails the content
  ///   WILL STILL BE SAVED
  /// - Can optionally set autoSendTime to specify the time at which the draft should be automatically sent by the server
  /// - The ID of the saved draft is returned in the "id" attribute of the response.
  /// - The ID referenced in the response's "idnt" attribute specifies the folder where the sent message is saved.
  Future<SaveDraftResponse?> saveDraft(
    SaveDraftMsg msg, {
    bool? wantImapUid,
    bool? wantModifiedSequence,
  }) {
    return invoke(
      SaveDraftRequest(
        msg,
        wantImapUid: wantImapUid,
        wantModifiedSequence: wantModifiedSequence,
      ),
      fromMap: (data) =>
          SaveDraftEnvelope.fromMap(data).body.response as SaveDraftResponse?,
    );
  }

  /// Save a list of folder names subscribed to via IMAP
  Future<SaveIMAPSubscriptionsResponse?> saveIMAPSubscriptions(
      List<String> subscriptions) {
    return invoke(
      SaveIMAPSubscriptionsRequest(subscriptions),
      fromMap: (data) => SaveIMAPSubscriptionsEnvelope.fromMap(data)
          .body
          .response as SaveIMAPSubscriptionsResponse?,
    );
  }

  /// Search action
  Future<SearchActionResponse?> searchAction(
      SearchRequest searchRequest, BulkAction bulkAction) {
    return invoke(
      SearchActionRequest(searchRequest, bulkAction),
      fromMap: (data) => SearchActionEnvelope.fromMap(data).body.response
          as SearchActionResponse?,
    );
  }

  /// Search a conversation
  Future<SearchConvResponse?> searchConv(
    String conversationId, {
    bool? nestMessages,
    bool? includeTagDeleted,
    bool? includeTagMuted,
    String? allowableTaskStatus,
    int? calItemExpandStart,
    int? calItemExpandEnd,
    String? query,
    bool? inDumpster,
    String? searchTypes,
    String? groupBy,
    bool? quick,
    SearchSortBy? sortBy,
    String? fetch,
    bool? markRead,
    int? maxInlinedLength,
    bool? wantHtml,
    bool? needCanExpand,
    bool? neuterImages,
    WantRecipsSetting? wantRecipients,
    bool? prefetch,
    ResultMode? resultMode,
    bool? fullConversation,
    String? field,
    int? limit,
    int? offset,
    List<AttributeName> headers = const [],
    CalTZInfo? timezone,
    String? locale,
    CursorInfo? cursor,
    MsgContent? wantContent,
    bool? includeMemberOf,
  }) {
    return invoke(
      SearchConvRequest(
        conversationId,
        nestMessages: nestMessages,
        includeTagDeleted: includeTagDeleted,
        includeTagMuted: includeTagMuted,
        allowableTaskStatus: allowableTaskStatus,
        calItemExpandStart: calItemExpandStart,
        calItemExpandEnd: calItemExpandEnd,
        query: query,
        inDumpster: inDumpster,
        searchTypes: searchTypes,
        groupBy: groupBy,
        quick: quick,
        sortBy: sortBy,
        fetch: fetch,
        markRead: markRead,
        maxInlinedLength: maxInlinedLength,
        wantHtml: wantHtml,
        needCanExpand: needCanExpand,
        neuterImages: neuterImages,
        wantRecipients: wantRecipients,
        prefetch: prefetch,
        resultMode: resultMode,
        fullConversation: fullConversation,
        field: field,
        limit: limit,
        offset: offset,
        headers: headers,
        timezone: timezone,
        locale: locale,
        cursor: cursor,
        wantContent: wantContent,
        includeMemberOf: includeMemberOf,
      ),
      fromMap: (data) =>
          SearchConvEnvelope.fromMap(data).body.response as SearchConvResponse?,
    );
  }

  /// Search
  /// For a response, the order of the returned results represents the sorted order.
  /// There is not a separate index attribute or element.
  Future<SearchResponse?> search({
    bool? warmup,
    bool? includeTagDeleted,
    bool? includeTagMuted,
    String? allowableTaskStatus,
    int? calItemExpandStart,
    int? calItemExpandEnd,
    String? query,
    bool? inDumpster,
    String? searchTypes,
    String? groupBy,
    bool? quick,
    SearchSortBy? sortBy,
    String? fetch,
    bool? markRead,
    int? maxInlinedLength,
    bool? wantHtml,
    bool? needCanExpand,
    bool? neuterImages,
    WantRecipsSetting? wantRecipients,
    bool? prefetch,
    ResultMode? resultMode,
    bool? fullConversation,
    String? field,
    int? limit,
    int? offset,
    List<AttributeName> headers = const [],
    CalTZInfo? timezone,
    String? locale,
    CursorInfo? cursor,
    MsgContent? wantContent,
    bool? includeMemberOf,
  }) {
    return invoke(
      SearchRequest(
        warmup: warmup,
        includeTagDeleted: includeTagDeleted,
        includeTagMuted: includeTagMuted,
        allowableTaskStatus: allowableTaskStatus,
        calItemExpandStart: calItemExpandStart,
        calItemExpandEnd: calItemExpandEnd,
        query: query,
        inDumpster: inDumpster,
        searchTypes: searchTypes,
        groupBy: groupBy,
        quick: quick,
        sortBy: sortBy,
        fetch: fetch,
        markRead: markRead,
        maxInlinedLength: maxInlinedLength,
        wantHtml: wantHtml,
        needCanExpand: needCanExpand,
        neuterImages: neuterImages,
        wantRecipients: wantRecipients,
        prefetch: prefetch,
        resultMode: resultMode,
        fullConversation: fullConversation,
        field: field,
        limit: limit,
        offset: offset,
        headers: headers,
        timezone: timezone,
        locale: locale,
        cursor: cursor,
        wantContent: wantContent,
        includeMemberOf: includeMemberOf,
      ),
      fromMap: (data) =>
          SearchEnvelope.fromMap(data).body.response as SearchResponse?,
    );
  }

  /// Send a delivery report
  Future<SendDeliveryReportResponse?> sendDeliveryReport(String messageId) {
    return invoke(
      SendDeliveryReportRequest(messageId),
      fromMap: (data) => SendDeliveryReportEnvelope.fromMap(data).body.response
          as SendDeliveryReportResponse?,
    );
  }

  /// Send a reply to an invite
  Future<SendInviteReplyResponse?> sendInviteReply(
    String id,
    int componentNum, {
    VerbType? verb,
    bool? updateOrganizer,
    String? identityId,
    DtTimeInfo? exceptionId,
    CalTZInfo? timezone,
    Msg? msg,
  }) {
    return invoke(
      SendInviteReplyRequest(
        id,
        componentNum,
        verb: verb,
        updateOrganizer: updateOrganizer,
        identityId: identityId,
        exceptionId: exceptionId,
        timezone: timezone,
        msg: msg,
      ),
      fromMap: (data) => SendInviteReplyEnvelope.fromMap(data).body.response
          as SendInviteReplyResponse?,
    );
  }

  /// Send message
  ///
  /// - Supports (f)rom, (t)o, (c)c, (b)cc, (r)eply-to, (s)ender, read-receipt (n)otification "type" on <e> elements.
  /// - Only allowed one top-level <mp> but can nest <mp>s within if multipart/*
  /// - A leaf <mp> can have inlined content (<mp ct="{content-type}"><content>...</content></mp>)
  /// - A leaf <mp> can have referenced content (<mp><attach ...></mp>)
  /// - Any <mp> can have a Content-ID header attached to it.
  /// - On reply/forward, set origid on <m> element and set rt to "r" or "w", respectively
  /// - Can optionally set identity-id to specify the identity being used to compose the message
  /// - If noSave is set, a copy will not be saved to sent regardless of account/identity settings
  /// - Can set priority high (!) or low (?) on sent message by specifying "f" attr on <m>
  /// - The message to be sent can be fully specified under the <m> element or,
  ///   to compose the message remotely remotely, upload it via FileUploadServlet,
  ///   and submit it through our server using something like:
  ///      <code>
  ///         <SendMsgRequest [suid="{send-uid}"] [needCalendarSentByFixup="0|1"]>
  ///             <m aid="{uploaded-MIME-body-ID}" [origid="..." rt="r|w"]/>
  ///         </SendMsgRequest>
  ///      </code>
  /// - If the message is saved to the sent folder then the ID of the message is returned.
  ///   Otherwise, no ID is returned -- just a <m> is returned.
  Future<SendMsgResponse?> sendMsg(
    MsgToSend msg, {
    bool? needCalendarSentbyFixup,
    bool? isCalendarForward,
    bool? noSaveToSent,
    bool? fetchSavedMsg,
    String? sendUid,
    bool? deliveryReport,
  }) {
    return invoke(
      SendMsgRequest(
        msg,
        needCalendarSentByFixup: needCalendarSentbyFixup,
        isCalendarForward: isCalendarForward,
        noSaveToSent: noSaveToSent,
        fetchSavedMsg: fetchSavedMsg,
        sendUid: sendUid,
        deliveryReport: deliveryReport,
      ),
      fromMap: (data) =>
          SendMsgEnvelope.fromMap(data).body.response as SendMsgResponse?,
    );
  }

  /// Send share notification
  /// The client can list the recipient email addresses for the share, along with the itemId of the item being shared.
  Future<SendShareNotificationResponse?> sendShareNotification(
    Id item, {
    List<EmailAddrInfo> emailAddresses = const [],
    ShareAction? action,
    String? notes,
  }) {
    return invoke(
      SendShareNotificationRequest(
        item,
        emailAddresses: emailAddresses,
        action: action,
        notes: notes,
      ),
      fromMap: (data) => SendShareNotificationEnvelope.fromMap(data)
          .body
          .response as SendShareNotificationResponse?,
    );
  }

  /// SendVerificationCodeRequest results in a random verification code being generated and sent to a device.
  Future<SendVerificationCodeResponse?> sendVerificationCode(String address) {
    return invoke(
      SendVerificationCodeRequest(address),
      fromMap: (data) => SendVerificationCodeEnvelope.fromMap(data)
          .body
          .response as SendVerificationCodeResponse?,
    );
  }

  /// Directly set status of an entire appointment. This API is intended for mailbox
  /// Migration (ie migrating a mailbox onto this server) and is not used by normal mail clients.
  /// Need to specify folder for appointment
  /// Need way to add message WITHOUT processing it for calendar parts.
  /// Need to generate and patch-in the iCalendar for the <inv> but w/o actually processing the <inv> as a new request
  Future<SetAppointmentResponse?> setAppointment({
    String? flags,
    String? tags,
    String? tagNames,
    String? folderId,
    bool? noNextAlarm,
    int? nextAlarm,
    SetCalendarItemInfo? defaultId,
    List<SetCalendarItemInfo> exceptions = const [],
    List<SetCalendarItemInfo> cancellations = const [],
    List<CalReply> replies = const [],
  }) {
    return invoke(
      SetAppointmentRequest(
        flags: flags,
        tags: tags,
        tagNames: tagNames,
        folderId: folderId,
        noNextAlarm: noNextAlarm,
        nextAlarm: nextAlarm,
        defaultId: defaultId,
        exceptions: exceptions,
        cancellations: cancellations,
        replies: replies,
      ),
      fromMap: (data) => SetAppointmentEnvelope.fromMap(data).body.response
          as SetAppointmentResponse?,
    );
  }

  /// Set custom metadata
  /// Setting a custom metadata section but providing no key/value pairs will remove the sction from the item
  Future<SetCustomMetadataResponse?> setCustomMetadata(
      MailCustomMetadata metadata,
      {String? id}) {
    return invoke(
      SetCustomMetadataRequest(metadata, id: id),
      fromMap: (data) => SetCustomMetadataEnvelope.fromMap(data).body.response
          as SetCustomMetadataResponse?,
    );
  }

  /// Set mailbox metadata
  /// - Setting a mailbox metadata section but providing no key/value pairs will remove the section from mailbox metadata
  /// - Empty value not allowed
  /// - {metadata-section-key} must be no more than 36 characters long
  ///   and must be in the format of {namespace}:{section-name}.
  ///   currently the only valid namespace is "zwc".
  Future<SetMailboxMetadataResponse?> setMailboxMetadata(
      MailCustomMetadata metadata) {
    return invoke(
      SetMailboxMetadataRequest(metadata),
      fromMap: (data) => SetMailboxMetadataEnvelope.fromMap(data).body.response
          as SetMailboxMetadataResponse?,
    );
  }

  /// Set recover account
  Future<SetRecoveryAccountResponse?> setRecoveryAccount(
    RecoveryAccountOperation operation,
    String recoveryAccount,
    String verificationCode, {
    Channel? channel,
  }) {
    return invoke(
      SetRecoveryAccountRequest(
        operation,
        recoveryAccount,
        verificationCode,
        channel: channel,
      ),
      fromMap: (data) => SetRecoveryAccountEnvelope.fromMap(data).body.response
          as SetRecoveryAccountResponse?,
    );
  }

  /// Directly set status of an entire task.
  /// See SetAppointment for more information.
  Future<SetTaskResponse?> setTask({
    String? flags,
    String? tags,
    String? tagNames,
    String? folderId,
    bool? noNextAlarm,
    int? nextAlarm,
    SetCalendarItemInfo? defaultId,
    List<SetCalendarItemInfo> exceptions = const [],
    List<SetCalendarItemInfo> cancellations = const [],
    List<CalReply> replies = const [],
  }) {
    return invoke(
      SetTaskRequest(
        flags: flags,
        tags: tags,
        tagNames: tagNames,
        folderId: folderId,
        noNextAlarm: noNextAlarm,
        nextAlarm: nextAlarm,
        defaultId: defaultId,
        exceptions: exceptions,
        cancellations: cancellations,
        replies: replies,
      ),
      fromMap: (data) =>
          SetTaskEnvelope.fromMap(data).body.response as SetTaskResponse?,
    );
  }

  /// Snooze alarm(s) for appointments or tasks
  Future<SnoozeCalendarItemAlarmResponse?> snoozeCalendarItemAlarm({
    List<SnoozeAlarm> apptAlarms = const [],
    List<SnoozeAlarm> taskAlarms = const [],
  }) {
    return invoke(
      SnoozeCalendarItemAlarmRequest(
        apptAlarms: apptAlarms,
        taskAlarms: taskAlarms,
      ),
      fromMap: (data) => SnoozeCalendarItemAlarmEnvelope.fromMap(data)
          .body
          .response as SnoozeCalendarItemAlarmResponse?,
    );
  }

  /// Sync on other mailbox is done via specifying target account in SOAP header
  /// If we're delta syncing on another user's mailbox and any folders have changed:
  /// - If there are now no visible folders, you'll get an empty <folder> element
  /// - If there are any visible folders, you'll get the full visible folder hierarchy
  /// If a {root-folder-id} other than the mailbox root (folder 1) is requested or if not all folders are visible
  /// when syncing to another user's mailbox, all changed items in other folders are presented as deletes
  /// If the response is a mail.MUST_RESYNC fault, client has fallen too far out of date and must re-initial sync
  Future<SyncResponse?> sync({
    String? token,
    int? calendarCutoff,
    int? msgCutoff,
    String? folderId,
    bool? typedDeletes,
    int? deleteLimit,
    int? changeLimit,
  }) {
    return invoke(
      SyncRequest(
        token: token,
        calendarCutoff: calendarCutoff,
        msgCutoff: msgCutoff,
        folderId: folderId,
        typedDeletes: typedDeletes,
        deleteLimit: deleteLimit,
        changeLimit: changeLimit,
      ),
      fromMap: (data) =>
          SyncEnvelope.fromMap(data).body.response as SyncResponse?,
    );
  }

  /// Perform an action on a tag
  Future<TagActionResponse?> tagAction(TagActionSelector action) {
    return invoke(
      TagActionRequest(action),
      fromMap: (data) =>
          TagActionEnvelope.fromMap(data).body.response as TagActionResponse?,
    );
  }

  /// Tests the connection to the specified data source.
  /// Does not modify the data source or import data.
  /// If the id is specified, uses an existing data source.
  /// Any values specified in the request are used in the test instead of the saved values.
  Future<TestDataSourceResponse?> testDataSource({
    MailImapDataSource? imapDataSource,
    MailPop3DataSource? pop3DataSource,
    MailCaldavDataSource? caldavDataSource,
    MailYabDataSource? yabDataSource,
    MailRssDataSource? rssDataSource,
    MailGalDataSource? galDataSource,
    MailCalDataSource? calDataSource,
    MailUnknownDataSource? unknownDataSource,
  }) {
    return invoke(
      TestDataSourceRequest(
        imapDataSource: imapDataSource,
        pop3DataSource: pop3DataSource,
        caldavDataSource: caldavDataSource,
        yabDataSource: yabDataSource,
        rssDataSource: rssDataSource,
        galDataSource: galDataSource,
        calDataSource: calDataSource,
        unknownDataSource: unknownDataSource,
      ),
      fromMap: (data) => TestDataSourceEnvelope.fromMap(data).body.response
          as TestDataSourceResponse?,
    );
  }

  /// Validate the verification code sent to a device.
  /// After successful validation the server sets the device email address as
  /// the value of zimbraCalendarReminderDeviceEmail account attribute.
  Future<VerifyCodeResponse?> verifyCode(
    String address,
    String verificationCode,
  ) {
    return invoke(
      VerifyCodeRequest(address, verificationCode),
      fromMap: (data) =>
          VerifyCodeEnvelope.fromMap(data).body.response as VerifyCodeResponse?,
    );
  }

  /// WaitSetRequest optionally modifies the wait set and checks for any notifications.
  /// If <block> is set and there are no notifications, then this API will BLOCK until there is data.
  ///
  /// Client should always set 'seq' to be the highest known value it has received from the server.  The server will use
  /// this information to retransmit lost data.
  ///
  /// If the client sends a last known sync token then the notification is calculated by comparing the accounts current
  /// token with the client's last known.
  ///
  /// If the client does not send a last known sync token, then notification is based on change since last Wait
  /// (or change since &lt;add> if this is the first time Wait has been called with the account)
  ///
  /// The client may specify a custom timeout-length for their request if they know something about the particular
  /// underlying network.  The server may or may not honor this request (depending on server configured max/min values).
  /// See LocalConfig values:
  /// - zimbra_waitset_default_request_timeout,
  /// - zimbra_waitset_min_request_timeout,
  /// - zimbra_waitset_max_request_timeout,
  /// - zimbra_admin_waitset_default_request_timeout,
  /// - zimbra_admin_waitset_min_request_timeout, and
  /// - zimbra_admin_waitset_max_request_timeout
  /// WaitSet: scalable mechanism for listening for changes to one or more accounts
  Future<WaitSetResponse?> waitSet(
    String waitSetId, {
    String? lastKnownSeqNo,
    bool? block,
    String? defaultInterests,
    int? timeout,
    bool? expand,
    List<WaitSetAddSpec> addAccounts = const [],
    List<WaitSetAddSpec> updateAccounts = const [],
    List<Id> removeAccounts = const [],
  }) {
    return invoke(
      WaitSetRequest(
        waitSetId,
        lastKnownSeqNo: lastKnownSeqNo,
        block: block,
        defaultInterests: defaultInterests,
        timeout: timeout,
        expand: expand,
        addAccounts: addAccounts,
        updateAccounts: updateAccounts,
        removeAccounts: removeAccounts,
      ),
      fromMap: (data) =>
          WaitSetEnvelope.fromMap(data).body.response as WaitSetResponse?,
    );
  }
}

// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'addheader_action.dart';
import 'deleteheader_action.dart';
import 'discard_action.dart';
import 'ereject_action.dart';
import 'file_into_action.dart';
import 'filter_variables.dart';
import 'flag_action.dart';
import 'keep_action.dart';
import 'log_action.dart';
import 'notify_action.dart';
import 'redirect_action.dart';
import 'reject_action.dart';
import 'replaceheader_action.dart';
import 'reply_action.dart';
import 'rfc_compliant_notify_action.dart';
import 'stop_action.dart';
import 'tag_action.dart';

class FilterActions {
  /// Filter variables
  final List<FilterVariables> filterVariables;

  /// Keep filter actions
  final List<KeepAction> keepActions;

  /// Discard filter actions
  final List<DiscardAction> discardActions;

  /// File into filter actions
  final List<FileIntoAction> fileIntoActions;

  /// Flag filter actions
  final List<FlagAction> flagActions;

  /// Tag filter actions
  final List<TagAction> tagActions;

  /// Redirect filter actions
  final List<RedirectAction> redirectActions;

  /// Reply filter actions
  final List<ReplyAction> replyActions;

  /// Notify filter actions
  final List<NotifyAction> notifyActions;

  /// RFC compliant notify filter actions
  final List<RFCCompliantNotifyAction> rfcCompliantNotifyActions;

  /// Stop filter actions
  final List<StopAction> stopActions;

  /// Reject filter actions
  final List<RejectAction> rejectActions;

  /// Ereject filter actions
  final List<ErejectAction> erejectActions;

  /// Log filter actions
  final List<LogAction> logActions;

  /// Add header filter actions
  final List<AddheaderAction> addheaderActions;

  /// Delete header filter actions
  final List<DeleteheaderAction> deleteheaderActions;

  /// Replace header filter actions
  final List<ReplaceheaderAction> replaceheaderActions;

  FilterActions(
      {this.filterVariables = const [],
      this.keepActions = const [],
      this.discardActions = const [],
      this.fileIntoActions = const [],
      this.flagActions = const [],
      this.tagActions = const [],
      this.redirectActions = const [],
      this.replyActions = const [],
      this.notifyActions = const [],
      this.rfcCompliantNotifyActions = const [],
      this.stopActions = const [],
      this.rejectActions = const [],
      this.erejectActions = const [],
      this.logActions = const [],
      this.addheaderActions = const [],
      this.deleteheaderActions = const [],
      this.replaceheaderActions = const []});

  factory FilterActions.fromMap(Map<String, dynamic> data) => FilterActions(
        filterVariables: (data['filterVariables'] is Iterable)
            ? List.from((data['filterVariables'] as Iterable)
                .map<FilterVariables>((action) => FilterVariables.fromMap(action)))
            : [],
        keepActions: (data['actionKeep'] is Iterable)
            ? List.from((data['actionKeep'] as Iterable).map<KeepAction>((action) => KeepAction.fromMap(action)))
            : [],
        discardActions: (data['actionDiscard'] is Iterable)
            ? List.from(
                (data['actionDiscard'] as Iterable).map<DiscardAction>((action) => DiscardAction.fromMap(action)))
            : [],
        fileIntoActions: (data['actionFileInto'] is Iterable)
            ? List.from(
                (data['actionFileInto'] as Iterable).map<FileIntoAction>((action) => FileIntoAction.fromMap(action)))
            : [],
        flagActions: (data['actionFlag'] is Iterable)
            ? List.from((data['actionFlag'] as Iterable).map<FlagAction>((action) => FlagAction.fromMap(action)))
            : [],
        tagActions: (data['actionTag'] is Iterable)
            ? List.from((data['actionTag'] as Iterable).map<TagAction>((action) => TagAction.fromMap(action)))
            : [],
        redirectActions: (data['actionRedirect'] is Iterable)
            ? List.from(
                (data['actionRedirect'] as Iterable).map<RedirectAction>((action) => RedirectAction.fromMap(action)))
            : [],
        replyActions: (data['actionReply'] is Iterable)
            ? List.from((data['actionReply'] as Iterable).map<ReplyAction>((action) => ReplyAction.fromMap(action)))
            : [],
        notifyActions: (data['actionNotify'] is Iterable)
            ? List.from((data['actionNotify'] as Iterable).map<NotifyAction>((action) => NotifyAction.fromMap(action)))
            : [],
        rfcCompliantNotifyActions: (data['actionRFCCompliantNotify'] is Iterable)
            ? List.from((data['actionRFCCompliantNotify'] as Iterable)
                .map<RFCCompliantNotifyAction>((action) => RFCCompliantNotifyAction.fromMap(action)))
            : [],
        stopActions: (data['actionStop'] is Iterable)
            ? List.from((data['actionStop'] as Iterable).map<StopAction>((action) => StopAction.fromMap(action)))
            : [],
        rejectActions: (data['actionReject'] is Iterable)
            ? List.from((data['actionReject'] as Iterable).map<RejectAction>((action) => RejectAction.fromMap(action)))
            : [],
        erejectActions: (data['actionEreject'] is Iterable)
            ? List.from(
                (data['actionEreject'] as Iterable).map<ErejectAction>((action) => ErejectAction.fromMap(action)))
            : [],
        logActions: (data['actionLog'] is Iterable)
            ? List.from((data['actionLog'] as Iterable).map<LogAction>((action) => LogAction.fromMap(action)))
            : [],
        addheaderActions: (data['actionAddheader'] is Iterable)
            ? List.from((data['actionAddheader'] as Iterable)
                .map<AddheaderAction>((action) => AddheaderAction.fromMap(action)))
            : [],
        deleteheaderActions: (data['actionDeleteheader'] is Iterable)
            ? List.from((data['actionDeleteheader'] as Iterable)
                .map<DeleteheaderAction>((action) => DeleteheaderAction.fromMap(action)))
            : [],
        replaceheaderActions: (data['actionReplaceheader'] is Iterable)
            ? List.from((data['actionReplaceheader'] as Iterable)
                .map<ReplaceheaderAction>((action) => ReplaceheaderAction.fromMap(action)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        if (filterVariables.isNotEmpty)
          'filterVariables': filterVariables.map((variable) => variable.toMap()).toList(),
        if (keepActions.isNotEmpty) 'actionKeep': keepActions.map((action) => action.toMap()).toList(),
        if (discardActions.isNotEmpty) 'actionDiscard': discardActions.map((action) => action.toMap()).toList(),
        if (fileIntoActions.isNotEmpty) 'actionFileInto': fileIntoActions.map((action) => action.toMap()).toList(),
        if (flagActions.isNotEmpty) 'actionFlag': flagActions.map((action) => action.toMap()).toList(),
        if (tagActions.isNotEmpty) 'actionTag': tagActions.map((action) => action.toMap()).toList(),
        if (redirectActions.isNotEmpty) 'actionRedirect': redirectActions.map((action) => action.toMap()).toList(),
        if (replyActions.isNotEmpty) 'actionReply': replyActions.map((action) => action.toMap()).toList(),
        if (notifyActions.isNotEmpty) 'actionNotify': notifyActions.map((action) => action.toMap()).toList(),
        if (rfcCompliantNotifyActions.isNotEmpty)
          'actionRFCCompliantNotify': rfcCompliantNotifyActions.map((action) => action.toMap()).toList(),
        if (stopActions.isNotEmpty) 'actionStop': stopActions.map((action) => action.toMap()).toList(),
        if (rejectActions.isNotEmpty) 'actionReject': rejectActions.map((action) => action.toMap()).toList(),
        if (erejectActions.isNotEmpty) 'actionEreject': erejectActions.map((action) => action.toMap()).toList(),
        if (logActions.isNotEmpty) 'actionLog': logActions.map((action) => action.toMap()).toList(),
        if (addheaderActions.isNotEmpty) 'actionAddheader': addheaderActions.map((action) => action.toMap()).toList(),
        if (deleteheaderActions.isNotEmpty)
          'actionDeleteheader': deleteheaderActions.map((action) => action.toMap()).toList(),
        if (replaceheaderActions.isNotEmpty)
          'actionReplaceheader': replaceheaderActions.map((action) => action.toMap()).toList(),
      };
}

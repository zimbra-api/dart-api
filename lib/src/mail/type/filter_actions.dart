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

  const FilterActions({
    this.filterVariables = const [],
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
    this.replaceheaderActions = const [],
  });

  factory FilterActions.fromMap(Map<String, dynamic> data) => FilterActions(
        filterVariables: (data['filterVariables'] is Iterable)
            ? (data['filterVariables'] as Iterable)
                .map<FilterVariables>(
                  (action) => FilterVariables.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        keepActions: (data['actionKeep'] is Iterable)
            ? (data['actionKeep'] as Iterable)
                .map<KeepAction>(
                  (action) => KeepAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        discardActions: (data['actionDiscard'] is Iterable)
            ? (data['actionDiscard'] as Iterable)
                .map<DiscardAction>(
                  (action) => DiscardAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        fileIntoActions: (data['actionFileInto'] is Iterable)
            ? (data['actionFileInto'] as Iterable)
                .map<FileIntoAction>(
                  (action) => FileIntoAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        flagActions: (data['actionFlag'] is Iterable)
            ? (data['actionFlag'] as Iterable)
                .map<FlagAction>(
                  (action) => FlagAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        tagActions: (data['actionTag'] is Iterable)
            ? (data['actionTag'] as Iterable)
                .map<TagAction>(
                  (action) => TagAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        redirectActions: (data['actionRedirect'] is Iterable)
            ? (data['actionRedirect'] as Iterable)
                .map<RedirectAction>(
                  (action) => RedirectAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        replyActions: (data['actionReply'] is Iterable)
            ? (data['actionReply'] as Iterable)
                .map<ReplyAction>(
                  (action) => ReplyAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        notifyActions: (data['actionNotify'] is Iterable)
            ? (data['actionNotify'] as Iterable)
                .map<NotifyAction>(
                  (action) => NotifyAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        rfcCompliantNotifyActions: (data['actionRFCCompliantNotify'] is Iterable)
            ? (data['actionRFCCompliantNotify'] as Iterable)
                .map<RFCCompliantNotifyAction>(
                  (action) => RFCCompliantNotifyAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        stopActions: (data['actionStop'] is Iterable)
            ? (data['actionStop'] as Iterable)
                .map<StopAction>(
                  (action) => StopAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        rejectActions: (data['actionReject'] is Iterable)
            ? (data['actionReject'] as Iterable)
                .map<RejectAction>(
                  (action) => RejectAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        erejectActions: (data['actionEreject'] is Iterable)
            ? (data['actionEreject'] as Iterable)
                .map<ErejectAction>(
                  (action) => ErejectAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        logActions: (data['actionLog'] is Iterable)
            ? (data['actionLog'] as Iterable)
                .map<LogAction>(
                  (action) => LogAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        addheaderActions: (data['actionAddheader'] is Iterable)
            ? (data['actionAddheader'] as Iterable)
                .map<AddheaderAction>(
                  (action) => AddheaderAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        deleteheaderActions: (data['actionDeleteheader'] is Iterable)
            ? (data['actionDeleteheader'] as Iterable)
                .map<DeleteheaderAction>(
                  (action) => DeleteheaderAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
        replaceheaderActions: (data['actionReplaceheader'] is Iterable)
            ? (data['actionReplaceheader'] as Iterable)
                .map<ReplaceheaderAction>(
                  (action) => ReplaceheaderAction.fromMap(action),
                )
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        if (filterVariables.isNotEmpty)
          'filterVariables': filterVariables
              .map(
                (variable) => variable.toMap(),
              )
              .toList(growable: false),
        if (keepActions.isNotEmpty)
          'actionKeep': keepActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (discardActions.isNotEmpty)
          'actionDiscard': discardActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (fileIntoActions.isNotEmpty)
          'actionFileInto': fileIntoActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (flagActions.isNotEmpty)
          'actionFlag': flagActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (tagActions.isNotEmpty)
          'actionTag': tagActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (redirectActions.isNotEmpty)
          'actionRedirect': redirectActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (replyActions.isNotEmpty)
          'actionReply': replyActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (notifyActions.isNotEmpty)
          'actionNotify': notifyActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (rfcCompliantNotifyActions.isNotEmpty)
          'actionRFCCompliantNotify': rfcCompliantNotifyActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (stopActions.isNotEmpty)
          'actionStop': stopActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (rejectActions.isNotEmpty)
          'actionReject': rejectActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (erejectActions.isNotEmpty)
          'actionEreject': erejectActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (logActions.isNotEmpty)
          'actionLog': logActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (addheaderActions.isNotEmpty)
          'actionAddheader': addheaderActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (deleteheaderActions.isNotEmpty)
          'actionDeleteheader': deleteheaderActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
        if (replaceheaderActions.isNotEmpty)
          'actionReplaceheader': replaceheaderActions
              .map(
                (action) => action.toMap(),
              )
              .toList(growable: false),
      };
}

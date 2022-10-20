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

  factory FilterActions.fromJson(Map<String, dynamic> json) => FilterActions(
        filterVariables: (json['filterVariables'] is Iterable)
            ? List.from((json['filterVariables'] as Iterable)
                .map<FilterVariables>((action) => FilterVariables.fromJson(action)))
            : [],
        keepActions: (json['actionKeep'] is Iterable)
            ? List.from((json['actionKeep'] as Iterable).map<KeepAction>((action) => KeepAction.fromJson(action)))
            : [],
        discardActions: (json['actionDiscard'] is Iterable)
            ? List.from(
                (json['actionDiscard'] as Iterable).map<DiscardAction>((action) => DiscardAction.fromJson(action)))
            : [],
        fileIntoActions: (json['actionFileInto'] is Iterable)
            ? List.from(
                (json['actionFileInto'] as Iterable).map<FileIntoAction>((action) => FileIntoAction.fromJson(action)))
            : [],
        flagActions: (json['actionFlag'] is Iterable)
            ? List.from((json['actionFlag'] as Iterable).map<FlagAction>((action) => FlagAction.fromJson(action)))
            : [],
        tagActions: (json['actionTag'] is Iterable)
            ? List.from((json['actionTag'] as Iterable).map<TagAction>((action) => TagAction.fromJson(action)))
            : [],
        redirectActions: (json['actionRedirect'] is Iterable)
            ? List.from(
                (json['actionRedirect'] as Iterable).map<RedirectAction>((action) => RedirectAction.fromJson(action)))
            : [],
        replyActions: (json['actionReply'] is Iterable)
            ? List.from((json['actionReply'] as Iterable).map<ReplyAction>((action) => ReplyAction.fromJson(action)))
            : [],
        notifyActions: (json['actionNotify'] is Iterable)
            ? List.from((json['actionNotify'] as Iterable).map<NotifyAction>((action) => NotifyAction.fromJson(action)))
            : [],
        rfcCompliantNotifyActions: (json['actionRFCCompliantNotify'] is Iterable)
            ? List.from((json['actionRFCCompliantNotify'] as Iterable)
                .map<RFCCompliantNotifyAction>((action) => RFCCompliantNotifyAction.fromJson(action)))
            : [],
        stopActions: (json['actionStop'] is Iterable)
            ? List.from((json['actionStop'] as Iterable).map<StopAction>((action) => StopAction.fromJson(action)))
            : [],
        rejectActions: (json['actionReject'] is Iterable)
            ? List.from((json['actionReject'] as Iterable).map<RejectAction>((action) => RejectAction.fromJson(action)))
            : [],
        erejectActions: (json['actionEreject'] is Iterable)
            ? List.from(
                (json['actionEreject'] as Iterable).map<ErejectAction>((action) => ErejectAction.fromJson(action)))
            : [],
        logActions: (json['actionLog'] is Iterable)
            ? List.from((json['actionLog'] as Iterable).map<LogAction>((action) => LogAction.fromJson(action)))
            : [],
        addheaderActions: (json['actionAddheader'] is Iterable)
            ? List.from((json['actionAddheader'] as Iterable)
                .map<AddheaderAction>((action) => AddheaderAction.fromJson(action)))
            : [],
        deleteheaderActions: (json['actionDeleteheader'] is Iterable)
            ? List.from((json['actionDeleteheader'] as Iterable)
                .map<DeleteheaderAction>((action) => DeleteheaderAction.fromJson(action)))
            : [],
        replaceheaderActions: (json['actionReplaceheader'] is Iterable)
            ? List.from((json['actionReplaceheader'] as Iterable)
                .map<ReplaceheaderAction>((action) => ReplaceheaderAction.fromJson(action)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        if (filterVariables.isNotEmpty)
          'filterVariables': filterVariables.map((variable) => variable.toJson()).toList(),
        if (keepActions.isNotEmpty) 'actionKeep': keepActions.map((action) => action.toJson()).toList(),
        if (discardActions.isNotEmpty) 'actionDiscard': discardActions.map((action) => action.toJson()).toList(),
        if (fileIntoActions.isNotEmpty) 'actionFileInto': fileIntoActions.map((action) => action.toJson()).toList(),
        if (flagActions.isNotEmpty) 'actionFlag': flagActions.map((action) => action.toJson()).toList(),
        if (tagActions.isNotEmpty) 'actionTag': tagActions.map((action) => action.toJson()).toList(),
        if (redirectActions.isNotEmpty) 'actionRedirect': redirectActions.map((action) => action.toJson()).toList(),
        if (replyActions.isNotEmpty) 'actionReply': replyActions.map((action) => action.toJson()).toList(),
        if (notifyActions.isNotEmpty) 'actionNotify': notifyActions.map((action) => action.toJson()).toList(),
        if (rfcCompliantNotifyActions.isNotEmpty)
          'actionRFCCompliantNotify': rfcCompliantNotifyActions.map((action) => action.toJson()).toList(),
        if (stopActions.isNotEmpty) 'actionStop': stopActions.map((action) => action.toJson()).toList(),
        if (rejectActions.isNotEmpty) 'actionReject': rejectActions.map((action) => action.toJson()).toList(),
        if (erejectActions.isNotEmpty) 'actionEreject': erejectActions.map((action) => action.toJson()).toList(),
        if (logActions.isNotEmpty) 'actionLog': logActions.map((action) => action.toJson()).toList(),
        if (addheaderActions.isNotEmpty) 'actionAddheader': addheaderActions.map((action) => action.toJson()).toList(),
        if (deleteheaderActions.isNotEmpty)
          'actionDeleteheader': deleteheaderActions.map((action) => action.toJson()).toList(),
        if (replaceheaderActions.isNotEmpty)
          'actionReplaceheader': replaceheaderActions.map((action) => action.toJson()).toList(),
      };
}

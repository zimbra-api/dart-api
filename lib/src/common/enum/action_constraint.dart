// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// List of characters; constrains the set of affected items in a conversation. t|j|s|d|o
/// t:   include items in the Trash
/// j:   include items in Spam/Junk
/// s:   include items in the user's Sent folder (not necessarily "Sent")
/// d:   include items in Drafts folder
/// o:   include items in any other folder
/// A leading '-' means to negate the constraint (e.g. "-t" means all messages not in Trash)
enum ActionConstraint {
  trash,
  notTrash,
  junk,
  notJunk,
  sent,
  notSent,
  drafts,
  notDrafts,
  other;

  String get name {
    switch (this) {
      case ActionConstraint.trash:
        return 't';
      case ActionConstraint.notTrash:
        return '-t';
      case ActionConstraint.junk:
        return 'j';
      case ActionConstraint.notJunk:
        return '-j';
      case ActionConstraint.sent:
        return 's';
      case ActionConstraint.notSent:
        return '-s';
      case ActionConstraint.drafts:
        return 'd';
      case ActionConstraint.notDrafts:
        return '-d';
      case ActionConstraint.other:
        return 'o';
    }
  }
}

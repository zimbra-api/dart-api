// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/auto_complete_match_type.dart';

/// Contains auto-complete match information
class AutoCompleteMatch {
  /// Comma-separated email addresses in case of group
  final String? email;

  /// Match type - gal|contact|rankingTable
  final AutoCompleteMatchType? matchType;

  /// Ranking
  final String? ranking;

  /// Set if the entry is a group
  final bool? isGroup;

  /// Set if the user has the right to expand group members.  Returned only if
  /// needExp is set in the request and only on group entries (isGroup is set).
  final bool? canExpandGroupMembers;

  /// Id
  final String? id;

  /// Folder ID
  final String? folder;

  /// String that should be displayed by the client
  final String? displayName;

  /// First Name
  final String? firstName;

  /// Middle Name
  final String? middleName;

  /// Last Name
  final String? lastName;

  /// Full Name
  final String? fullName;

  /// Nick Name
  final String? nickName;

  /// Company Name
  final String? company;

  /// FileAs
  final String? fileAs;

  const AutoCompleteMatch({
    this.email,
    this.matchType,
    this.ranking,
    this.isGroup,
    this.canExpandGroupMembers,
    this.id,
    this.folder,
    this.displayName,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.nickName,
    this.company,
    this.fileAs,
  });

  factory AutoCompleteMatch.fromMap(
    Map<String, dynamic> data,
  ) =>
      AutoCompleteMatch(
        email: data['email'],
        matchType: AutoCompleteMatchType.values.firstWhere(
          (type) => type.name == data['type'],
          orElse: () => AutoCompleteMatchType.contact,
        ),
        ranking: data['ranking'],
        isGroup: data['isGroup'],
        canExpandGroupMembers: data['exp'],
        id: data['id'],
        folder: data['l'],
        displayName: data['display'],
        firstName: data['first'],
        middleName: data['middle'],
        lastName: data['last'],
        fullName: data['full'],
        nickName: data['nick'],
        company: data['company'],
        fileAs: data['fileas'],
      );

  Map<String, dynamic> toMap() => {
        if (email != null) 'email': email,
        if (matchType != null) 'type': matchType!.name,
        if (ranking != null) 'ranking': ranking,
        if (isGroup != null) 'isGroup': isGroup,
        if (canExpandGroupMembers != null) 'exp': canExpandGroupMembers,
        if (id != null) 'id': id,
        if (folder != null) 'l': folder,
        if (displayName != null) 'display': displayName,
        if (firstName != null) 'first': firstName,
        if (middleName != null) 'middle': middleName,
        if (lastName != null) 'last': lastName,
        if (fullName != null) 'full': fullName,
        if (nickName != null) 'nick': nickName,
        if (company != null) 'company': company,
        if (fileAs != null) 'fileas': fileAs,
      };
}

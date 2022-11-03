// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ImportContact {
  /// Comma-separated list of created IDs
  final String? listOfCreatedIds;

  // Number imported
  final int? numImported;

  ImportContact({this.listOfCreatedIds, this.numImported});

  factory ImportContact.fromMap(Map<String, dynamic> data) =>
      ImportContact(listOfCreatedIds: data['ids'], numImported: data['n']);

  Map<String, dynamic> toMap() => {
        if (listOfCreatedIds != null) 'ids': listOfCreatedIds,
        if (numImported != null) 'n': numImported,
      };
}

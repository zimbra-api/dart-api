import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/open_imap_folder_envelope.dart';
import 'package:zimbra_api/src/mail/message/open_imap_folder_request.dart';
import 'package:zimbra_api/src/mail/type/imap_cursor_info.dart';

void main() {
  final faker = Faker();

  group('Open IMAP folder tests', (() {
    test('Open IMAP folder request', (() {
      final id = faker.guid.guid();
      final folderId = faker.guid.guid();
      final limit = faker.randomGenerator.integer(100);

      final request = OpenIMAPFolderRequest(folderId, limit, cursor: ImapCursorInfo(id));
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'OpenIMAPFolderRequest': {
            '_jsns': 'urn:zimbraMail',
            'l': folderId,
            'limit': limit,
            'cursor': {'id': id},
          }
        },
      });
    }));

    test('Open IMAP folder response', (() {
      final id = faker.randomGenerator.integer(100);
      final imapUid = faker.randomGenerator.integer(100);
      final type = faker.lorem.word();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final hasMore = faker.randomGenerator.boolean();

      final json = {
        'Body': {
          'OpenIMAPFolderResponse': {
            '_jsns': 'urn:zimbraMail',
            'more': hasMore,
            'folder': {
              'm': [
                {
                  'id': id,
                  'i4uid': imapUid,
                  't': type,
                  'f': flags,
                  'tn': tags,
                }
              ]
            },
            'cursor': {'id': id.toString()},
          }
        }
      };
      final envelope = OpenIMAPFolderEnvelope.fromJson(json);
      final response = envelope.openIMAPFolderBody.openIMAPFolderResponse!;

      expect(response.hasMore, hasMore);

      final msg = response.messages.first;
      expect(msg.id, id);
      expect(msg.imapUid, imapUid);
      expect(msg.type, type);
      expect(msg.flags, flags);
      expect(msg.tags, tags);

      final cursor = response.cursor!;
      expect(cursor.id, id.toString());
    }));
  }));
}
import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/mail/message/save_document_envelope.dart';
import 'package:zimbra_api/src/mail/message/save_document_request.dart';
import 'package:zimbra_api/src/mail/type/document_spec.dart';
import 'package:zimbra_api/src/mail/type/id_version.dart';
import 'package:zimbra_api/src/mail/type/message_part_spec.dart';

void main() {
  final faker = Faker();

  group('Save document tests', (() {
    test('Save document request', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final contentType = faker.lorem.word();
      final description = faker.lorem.word();
      final folderId = faker.guid.guid();
      final version = faker.randomGenerator.integer(100);
      final content = faker.lorem.word();
      final descEnabled = faker.randomGenerator.boolean();
      final flags = faker.lorem.word();
      final part = faker.lorem.word();

      final request = SaveDocumentRequest(DocumentSpec(
          name: name,
          contentType: contentType,
          description: description,
          folderId: folderId,
          id: id,
          version: version,
          content: content,
          descEnabled: descEnabled,
          flags: flags,
          upload: Id(id: id),
          messagePart: MessagePartSpec(part: part, id: id),
          docRevision: IdVersion(id: id, version: version)));
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'SaveDocumentRequest': {
            '_jsns': 'urn:zimbraMail',
            'doc': {
              'name': name,
              'ct': contentType,
              'desc': description,
              'l': folderId,
              'id': id,
              'ver': version,
              'content': content,
              'descEnabled': descEnabled,
              'f': flags,
              'upload': {
                'id': id,
              },
              'm': {
                'part': part,
                'id': id,
              },
              'doc': {
                'id': id,
                'ver': version,
              },
            },
          }
        },
      });
    }));

    test('Save document response', (() {
      final id = faker.guid.guid();
      final version = faker.randomGenerator.integer(100);
      final name = faker.lorem.word();

      final data = {
        'Body': {
          'SaveDocumentResponse': {
            '_jsns': 'urn:zimbraMail',
            'doc': {
              'id': id,
              'ver': version,
              'name': name,
            },
          }
        }
      };
      final envelope = SaveDocumentEnvelope.fromMap(data);
      final response = envelope.saveDocumentBody.saveDocumentResponse!;
      final doc = response.doc!;
      expect(doc.id, id);
      expect(doc.version, version);
      expect(doc.name, name);
    }));
  }));
}

import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/diff_document_envelope.dart';
import 'package:zimbra_api/src/mail/message/diff_document_request.dart';
import 'package:zimbra_api/src/mail/type/diff_document_version_spec.dart';

void main() {
  final faker = Faker();

  group('Diff document tests', (() {
    test('Diff document request', (() {
      final id = faker.guid.guid();
      final version1 = faker.randomGenerator.integer(100);
      final version2 = faker.randomGenerator.integer(100);

      final request = DiffDocumentRequest(DiffDocumentVersionSpec(
        id,
        version1: version1,
        version2: version2,
      ));
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'DiffDocumentRequest': {
            '_jsns': 'urn:zimbraMail',
            'doc': {
              'id': id,
              'v1': version1,
              'v2': version2,
            },
          }
        },
      });
    }));

    test('Diff document response', (() {
      final disposition = faker.lorem.word();
      final text = faker.lorem.word();

      final json = {
        'Body': {
          'DiffDocumentResponse': {
            '_jsns': 'urn:zimbraMail',
            'chunk': [
              {
                'disp': disposition,
                '_content': text,
              }
            ],
          }
        }
      };
      final envelope = DiffDocumentEnvelope.fromJson(json);
      final response = envelope.diffDocumentBody.diffDocumentResponse!;
      final chunk = response.chunks.first;

      expect(chunk.disposition, disposition);
      expect(chunk.text, text);
    }));
  }));
}

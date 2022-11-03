import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/create_signature_envelope.dart';
import 'package:zimbra_api/src/account/message/create_signature_request.dart';
import 'package:zimbra_api/src/account/message/create_signature_response.dart';
import 'package:zimbra_api/src/account/type/signature.dart';
import 'package:zimbra_api/src/account/type/signature_content.dart';
import 'package:zimbra_api/src/common/enum/content_type.dart';

void main() {
  final faker = Faker();

  group('Create signature tests', (() {
    test('Create signature request', (() {
      final name = faker.lorem.word();
      final id = faker.guid.guid();
      final cid = faker.guid.guid();
      final value = faker.lorem.word();

      final request = CreateSignatureRequest(
          Signature(name: name, id: id, cid: cid, contents: [SignatureContent(ContentType.textHtml, value: value)]));

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'CreateSignatureRequest': {
            '_jsns': 'urn:zimbraAccount',
            'signature': {
              'name': name,
              'id': id,
              'cid': cid,
              'content': [
                {
                  'type': ContentType.textHtml.name,
                  '_content': value,
                },
              ],
            },
          }
        }
      });
    }));

    test('Create signature response', (() {
      final name = faker.lorem.word();
      final id = faker.guid.guid();
      final cid = faker.guid.guid();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'CreateSignatureResponse': {
            '_jsns': 'urn:zimbraAccount',
            'signature': {
              'name': name,
              'id': id,
              'cid': cid,
              'content': [
                {
                  'type': ContentType.textHtml.name,
                  '_content': value,
                },
              ],
            },
          }
        }
      };
      final envelope = CreateSignatureEnvelope.fromMap(data);
      final response = envelope.body.response as CreateSignatureResponse;
      final signature = response.signature!;

      expect(signature.name, name);
      expect(signature.id, id);
      expect(signature.cid, cid);

      final content = signature.contents.first;
      expect(content.type, ContentType.textHtml);
      expect(content.value, value);
    }));
  }));
}

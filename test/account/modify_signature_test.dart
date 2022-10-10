import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/modify_signature_envelope.dart';
import 'package:zimbra_api/src/account/message/modify_signature_request.dart';
import 'package:zimbra_api/src/account/message/modify_signature_response.dart';
import 'package:zimbra_api/src/account/type/signature.dart';
import 'package:zimbra_api/src/account/type/signature_content.dart';
import 'package:zimbra_api/src/common/enum/content_type.dart';

void main() {
  final faker = Faker();

  group('Modify signature tests', (() {
    test('Modify signature request', (() {
      final name = faker.lorem.word();
      final id = faker.guid.guid();
      final cid = faker.guid.guid();
      final value = faker.lorem.word();

      final request = ModifySignatureRequest(
          Signature(name: name, id: id, cid: cid, contents: [SignatureContent(ContentType.textHtml, value: value)]));

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'ModifySignatureRequest': {
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

    test('Modify signature response', (() {
      final json = {
        'Body': {
          'ModifySignatureResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final envelope = ModifySignatureEnvelope.fromJson(json);
      expect(envelope.modifySignatureBody.modifySignatureResponse, isNotNull);
      expect(envelope.modifySignatureBody.modifySignatureResponse, isA<ModifySignatureResponse>());
    }));
  }));
}

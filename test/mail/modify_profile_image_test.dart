import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/modify_profile_image_envelope.dart';
import 'package:zimbra_api/src/mail/message/modify_profile_image_request.dart';
import 'package:zimbra_api/src/mail/message/modify_profile_image_response.dart';

void main() {
  final faker = Faker();

  group('Modify profile image test', (() {
    test('Modify profile image request', (() {
      final uploadId = faker.guid.guid();
      final imageB64Data = faker.lorem.word();

      final request = ModifyProfileImageRequest(uploadId: uploadId, imageB64Data: imageB64Data);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ModifyProfileImageRequest': {
            '_jsns': 'urn:zimbraMail',
            'uid': uploadId,
            '_content': imageB64Data,
          }
        },
      });
    }));

    test('Modify profile image response', (() {
      final itemId = faker.randomGenerator.integer(100);
      final data = {
        'Body': {
          'ModifyProfileImageResponse': {
            '_jsns': 'urn:zimbraMail',
            'itemId': itemId,
          }
        }
      };
      final envelope = ModifyProfileImageEnvelope.fromMap(data);
      final response = envelope.body.response as ModifyProfileImageResponse;
      expect(response.itemId, itemId);
    }));
  }));
}

import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/add_comment_envelope.dart';
import 'package:zimbra_api/src/mail/message/add_comment_request.dart';
import 'package:zimbra_api/src/mail/type/added_comment.dart';

void main() {
  final faker = Faker();

  group('Add comment tests', (() {
    test('Add comment request', () {
      final parentId = faker.guid.guid();
      final text = faker.lorem.word();
      final request = AddCommentRequest(AddedComment(parentId, text));

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'AddCommentRequest': {
            '_jsns': 'urn:zimbraMail',
            'comment': {
              'parentId': parentId,
              'text': text,
            },
          }
        },
      });
    });

    test('Add comment response', () {
      final id = faker.guid.guid();
      final json = {
        'Body': {
          'AddCommentResponse': {
            '_jsns': 'urn:zimbraAccount',
            'comment': {
              'id': id,
            },
          }
        }
      };
      final envelope = AddCommentEnvelope.fromJson(json);
      final response = envelope.addCommentBody.addCommentResponse!;
      final comment = response.comment!;

      expect(comment.id, id);
    });
  }));
}

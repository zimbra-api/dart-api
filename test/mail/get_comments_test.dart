import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_comments_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_comments_request.dart';
import 'package:zimbra_api/src/mail/type/parent_id.dart';

void main() {
  final faker = Faker();

  group('Get comments tests', (() {
    test('Get comments request', (() {
      final parentId = faker.guid.guid();

      final request = GetCommentsRequest(ParentId(parentId: parentId));
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetCommentsRequest': {
            '_jsns': 'urn:zimbraMail',
            'comment': {
              'parentId': parentId,
            },
          }
        },
      });
    }));

    test('Get comments response', (() {
      final id = faker.guid.guid();
      final email = faker.internet.email();
      final name = faker.person.name();
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final section = faker.lorem.word();

      final parentId = faker.guid.guid();
      final uuid = faker.guid.guid();
      final creatorEmail = faker.internet.email();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final color = faker.randomGenerator.integer(127);
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final date = faker.date.dateTime().millisecondsSinceEpoch;

      final json = {
        'Body': {
          'GetCommentsResponse': {
            '_jsns': 'urn:zimbraMail',
            'user': [
              {
                'id': id,
                'email': email,
                'name': name,
              }
            ],
            'comment': [
              {
                'parentId': parentId,
                'id': id,
                'uuid': uuid,
                'email': creatorEmail,
                'f': flags,
                't': tags,
                'tn': tagNames,
                'color': color,
                'rgb': rgb,
                'd': date,
                'meta': [
                  {
                    'section': section,
                    'a': [
                      {
                        'n': key,
                        '_content': value,
                      }
                    ]
                  }
                ],
              }
            ],
          }
        }
      };
      final envelope = GetCommentsEnvelope.fromJson(json);
      final response = envelope.getCommentsBody.getCommentsResponse!;

      final user = response.users.first;
      expect(user.id, id);
      expect(user.email, email);
      expect(user.name, name);

      final comment = response.comments.first;
      expect(comment.parentId, parentId);
      expect(comment.id, id);
      expect(comment.uuid, uuid);
      expect(comment.creatorEmail, creatorEmail);
      expect(comment.flags, flags);
      expect(comment.tags, tags);
      expect(comment.tagNames, tagNames);
      expect(comment.color, color);
      expect(comment.rgb, rgb);
      expect(comment.date, date);

      final meta = comment.metadatas.first;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);
    }));
  }));
}

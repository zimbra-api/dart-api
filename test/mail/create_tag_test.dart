import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/policy_type.dart';
import 'package:zimbra_api/src/mail/message/create_tag_envelope.dart';
import 'package:zimbra_api/src/mail/message/create_tag_request.dart';
import 'package:zimbra_api/src/mail/message/create_tag_response.dart';
import 'package:zimbra_api/src/mail/type/tag_spec.dart';

void main() {
  final faker = Faker();

  group('Create tag tests', (() {
    test('Create tag request', (() {
      final name = faker.lorem.word();
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final color = faker.randomGenerator.integer(127);

      final request = CreateTagRequest(TagSpec(name, rgb: rgb, color: color));
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'CreateTagRequest': {
            '_jsns': 'urn:zimbraMail',
            'tag': {
              'name': name,
              'rgb': rgb,
              'color': color,
            },
          }
        },
      });
    }));

    test('Create tag response', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final color = faker.randomGenerator.integer(127);
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final unread = faker.randomGenerator.integer(100);
      final count = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final revision = faker.randomGenerator.integer(100);
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequence = faker.randomGenerator.integer(100);
      final lifetime = faker.randomGenerator.integer(100).toString();

      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'CreateTagResponse': {
            '_jsns': 'urn:zimbraMail',
            'tag': {
              'id': id,
              'name': name,
              'color': color,
              'rgb': rgb,
              'u': unread,
              'n': count,
              'd': date,
              'rev': revision,
              'md': changeDate,
              'ms': modifiedSequence,
              'meta': [
                {
                  'section': section,
                  '_attrs': {
                    key: value,
                  },
                }
              ],
              'retentionPolicy': {
                'keep': [
                  {
                    'policy': [
                      {
                        'type': PolicyType.user.name,
                        'id': id,
                        'name': name,
                        'lifetime': lifetime,
                      }
                    ]
                  }
                ],
                'purge': [
                  {
                    'policy': [
                      {
                        'type': PolicyType.user.name,
                        'id': id,
                        'name': name,
                        'lifetime': lifetime,
                      }
                    ]
                  }
                ],
              },
            },
          }
        }
      };
      final envelope = CreateTagEnvelope.fromMap(data);
      final response = envelope.body.response as CreateTagResponse;

      final tag = response.tag!;
      expect(tag.id, id);
      expect(tag.name, name);
      expect(tag.color, color);
      expect(tag.rgb, rgb);
      expect(tag.unread, unread);
      expect(tag.count, count);
      expect(tag.date, date);
      expect(tag.revision, revision);
      expect(tag.changeDate, changeDate);
      expect(tag.modifiedSequence, modifiedSequence);

      final meta = tag.metadatas.first;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);

      final retentionPolicy = tag.retentionPolicy!;
      final keep = retentionPolicy.keep.first;
      final purge = retentionPolicy.purge.first;
      expect(keep.type, PolicyType.user);
      expect(keep.id, id);
      expect(keep.name, name);
      expect(keep.lifetime, lifetime);
      expect(purge.type, PolicyType.user);
      expect(purge.id, id);
      expect(purge.name, name);
      expect(purge.lifetime, lifetime);
    }));
  }));
}

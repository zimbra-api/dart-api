import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/create_note_envelope.dart';
import 'package:zimbra_api/src/mail/message/create_note_request.dart';
import 'package:zimbra_api/src/mail/type/new_note_spec.dart';

void main() {
  final faker = Faker();

  group('Create note tests', (() {
    test('Create note request', (() {
      final folder = faker.guid.guid();
      final content = faker.lorem.word();
      final color = faker.randomGenerator.integer(127);
      final bounds = faker.lorem.word();

      final request = CreateNoteRequest(NewNoteSpec(
        folder: folder,
        content: content,
        color: color,
        bounds: bounds,
      ));
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'CreateNoteRequest': {
            '_jsns': 'urn:zimbraMail',
            'note': {
              'l': folder,
              'content': content,
              'color': color,
              'pos': bounds,
            },
          }
        },
      });
    }));

    test('Create note response', (() {
      final id = faker.guid.guid();
      final revision = faker.randomGenerator.integer(100);
      final folder = faker.guid.guid();
      final date = faker.date.dateTime().millisecond;
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final bounds = faker.lorem.word();
      final color = faker.randomGenerator.integer(100);
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final changeDate = faker.date.dateTime().millisecond;
      final modifiedSequence = faker.randomGenerator.integer(100);
      final content = faker.lorem.word();

      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final json = {
        'Body': {
          'CreateNoteResponse': {
            '_jsns': 'urn:zimbraMail',
            'note': {
              'id': id,
              'rev': revision,
              'l': folder,
              'd': date,
              'f': flags,
              't': tags,
              'tn': tagNames,
              'pos': bounds,
              'color': color,
              'rgb': rgb,
              'md': changeDate,
              'ms': modifiedSequence,
              'content': {'_content': content},
              'meta': [
                {
                  'section': section,
                  'a': [
                    {
                      'n': key,
                      '_content': value,
                    }
                  ],
                }
              ],
            },
          }
        }
      };
      final envelope = CreateNoteEnvelope.fromJson(json);
      final response = envelope.createNoteBody.createNoteResponse!;
      final note = response.note!;

      expect(note.id, id);
      expect(note.revision, revision);
      expect(note.folder, folder);
      expect(note.date, date);
      expect(note.flags, flags);
      expect(note.tags, tags);
      expect(note.tagNames, tagNames);
      expect(note.bounds, bounds);
      expect(note.color, color);
      expect(note.rgb, rgb);
      expect(note.changeDate, changeDate);
      expect(note.modifiedSequence, modifiedSequence);
      expect(note.content, content);

      final meta = note.metadatas.first;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);
    }));
  }));
}

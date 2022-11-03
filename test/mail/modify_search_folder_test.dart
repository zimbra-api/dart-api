import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/grant_grantee_type.dart';
import 'package:zimbra_api/src/common/enum/item_type.dart';
import 'package:zimbra_api/src/common/enum/policy_type.dart';
import 'package:zimbra_api/src/common/enum/search_sort_by.dart';
import 'package:zimbra_api/src/common/enum/view_type.dart';
import 'package:zimbra_api/src/mail/message/modify_search_folder_envelope.dart';
import 'package:zimbra_api/src/mail/message/modify_search_folder_request.dart';
import 'package:zimbra_api/src/mail/type/folder.dart';
import 'package:zimbra_api/src/mail/type/modify_search_folder_spec.dart';

void main() {
  final faker = Faker();

  group('Modify search folder tests', (() {
    test('Modify search folder request', (() {
      final id = faker.guid.guid();
      final query = faker.lorem.word();
      final searchTypes = faker.randomGenerator
          .amount(
            (_) => random.element(ItemType.values).name,
            ItemType.values.length,
          )
          .join(',');

      final request = ModifySearchFolderRequest(ModifySearchFolderSpec(
        id: id,
        query: query,
        searchTypes: searchTypes,
        sortBy: SearchSortBy.none,
      ));
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ModifySearchFolderRequest': {
            '_jsns': 'urn:zimbraMail',
            'search': {
              'id': id,
              'query': query,
              'types': searchTypes,
              'sortBy': SearchSortBy.none.name,
            },
          }
        },
      });
    }));

    test('Modify search folder response', (() {
      final id = faker.guid.guid();
      final uuid = faker.guid.guid();
      final name = faker.lorem.word();
      final absoluteFolderPath = faker.lorem.word();
      final parentId = faker.guid.guid();
      final folderUuid = faker.guid.guid();
      final flags = faker.lorem.word();
      final color = faker.randomGenerator.integer(127);
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final unreadCount = faker.randomGenerator.integer(100);
      final imapUnreadCount = faker.randomGenerator.integer(100);
      final revision = faker.randomGenerator.integer(100);
      final modifiedSequence = faker.randomGenerator.integer(100);
      final changeDate = faker.date.dateTime().minute;
      final itemCount = faker.randomGenerator.integer(100);
      final imapItemCount = faker.randomGenerator.integer(100);
      final totalSize = faker.randomGenerator.integer(100);
      final imapModifiedSequence = faker.randomGenerator.integer(100);
      final imapUidNext = faker.randomGenerator.integer(100);
      final url = faker.internet.httpsUrl();
      final activeSyncDisabled = faker.randomGenerator.boolean();
      final webOfflineSyncDays = faker.randomGenerator.integer(100);
      final perm = faker.lorem.word();
      final recursive = faker.randomGenerator.boolean();
      final restUrl = faker.internet.httpsUrl();
      final deletable = faker.randomGenerator.boolean();

      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final lifetime = faker.randomGenerator.integer(100).toString();

      final internalGrantExpiry = faker.randomGenerator.integer(100);
      final guestGrantExpiry = faker.randomGenerator.integer(100);

      final granteeId = faker.guid.guid();
      final expiry = faker.randomGenerator.integer(100);
      final granteeName = faker.person.name();
      final guestPassword = faker.internet.password();
      final accessKey = faker.internet.password();

      final ownerEmail = faker.internet.email();
      final ownerAccountId = faker.guid.guid();
      final remoteFolderId = faker.randomGenerator.integer(100);
      final remoteUuid = faker.guid.guid();
      final remoteFolderName = faker.lorem.word();
      final reminderEnabled = faker.randomGenerator.boolean();
      final broken = faker.randomGenerator.boolean();

      final query = faker.lorem.word();
      final types = faker.lorem.words(3).join(',');

      final data = {
        'Body': {
          'ModifySearchFolderResponse': {
            '_jsns': 'urn:zimbraMail',
            'search': {
              'id': id,
              'uuid': uuid,
              'name': name,
              'query': query,
              'sortBy': SearchSortBy.none.name,
              'types': types,
              'absFolderPath': absoluteFolderPath,
              'l': parentId,
              'luuid': folderUuid,
              'f': flags,
              'color': color,
              'rgb': rgb,
              'u': unreadCount,
              'i4u': imapUnreadCount,
              'view': ViewType.conversation.name,
              'rev': revision,
              'ms': modifiedSequence,
              'md': changeDate,
              'n': itemCount,
              'i4n': imapItemCount,
              's': totalSize,
              'i4ms': imapModifiedSequence,
              'i4next': imapUidNext,
              'url': url,
              'activesyncdisabled': activeSyncDisabled,
              'webOfflineSyncDays': webOfflineSyncDays,
              'perm': perm,
              'recursive': recursive,
              'rest': restUrl,
              'deletable': deletable,
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
              'acl': {
                'internalGrantExpiry': internalGrantExpiry,
                'guestGrantExpiry': guestGrantExpiry,
                'grant': [
                  {
                    'perm': perm,
                    'gt': GrantGranteeType.all.name,
                    'zid': granteeId,
                    'expiry': expiry,
                    'd': granteeName,
                    'pw': guestPassword,
                    'key': accessKey,
                  }
                ],
              },
              'folder': [
                {
                  'id': id,
                  'uuid': uuid,
                  'name': name,
                }
              ],
              'link': [
                {
                  'id': id,
                  'name': name,
                  'owner': ownerEmail,
                  'zid': ownerAccountId,
                  'rid': remoteFolderId,
                  'ruuid': remoteUuid,
                  'oname': remoteFolderName,
                  'reminder': reminderEnabled,
                  'broken': broken,
                }
              ],
              'search': [
                {
                  'id': id,
                  'name': name,
                  'query': query,
                  'sortBy': SearchSortBy.none.name,
                  'types': types,
                }
              ],
              'retentionPolicy': {
                'keep': {
                  'policy': [
                    {
                      'type': PolicyType.user.name,
                      'id': id,
                      'name': name,
                      'lifetime': lifetime,
                    }
                  ],
                },
                'purge': {
                  'policy': [
                    {
                      'type': PolicyType.user.name,
                      'id': id,
                      'name': name,
                      'lifetime': lifetime,
                    }
                  ],
                },
              },
            },
          }
        }
      };
      final envelope = ModifySearchFolderEnvelope.fromMap(data);
      final response = envelope.modifySearchFolderBody.modifySearchFolderResponse!;

      final searchFolder = response.searchFolder!;
      expect(searchFolder.id, id);
      expect(searchFolder.uuid, uuid);
      expect(searchFolder.name, name);
      expect(searchFolder.query, query);
      expect(searchFolder.sortBy, SearchSortBy.none);
      expect(searchFolder.types, types);
      expect(searchFolder.absoluteFolderPath, absoluteFolderPath);
      expect(searchFolder.parentId, parentId);
      expect(searchFolder.folderUuid, folderUuid);
      expect(searchFolder.flags, flags);
      expect(searchFolder.color, color);
      expect(searchFolder.rgb, rgb);
      expect(searchFolder.unreadCount, unreadCount);
      expect(searchFolder.imapUnreadCount, imapUnreadCount);
      expect(searchFolder.view, ViewType.conversation);
      expect(searchFolder.revision, revision);
      expect(searchFolder.modifiedSequence, modifiedSequence);
      expect(searchFolder.changeDate, changeDate);
      expect(searchFolder.itemCount, itemCount);
      expect(searchFolder.imapItemCount, imapItemCount);
      expect(searchFolder.totalSize, totalSize);
      expect(searchFolder.imapModifiedSequence, imapModifiedSequence);
      expect(searchFolder.imapUidNext, imapUidNext);
      expect(searchFolder.url, url);
      expect(searchFolder.activeSyncDisabled, activeSyncDisabled);
      expect(searchFolder.webOfflineSyncDays, webOfflineSyncDays);
      expect(searchFolder.perm, perm);
      expect(searchFolder.recursive, recursive);
      expect(searchFolder.restUrl, restUrl);
      expect(searchFolder.deletable, deletable);

      final meta = searchFolder.metadatas.first;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);

      final acl = searchFolder.acl!;
      expect(acl.internalGrantExpiry, internalGrantExpiry);
      expect(acl.guestGrantExpiry, guestGrantExpiry);

      final grant = acl.grants.first;
      expect(grant.perm, perm);
      expect(grant.granteeType, GrantGranteeType.all);
      expect(grant.granteeId, granteeId);
      expect(grant.expiry, expiry);
      expect(grant.granteeName, granteeName);
      expect(grant.guestPassword, guestPassword);
      expect(grant.accessKey, accessKey);

      final subFolder = searchFolder.subFolders.first;
      expect(subFolder.id, id);
      expect(subFolder.uuid, uuid);
      expect(subFolder.name, name);
      expect(subFolder, isA<Folder>());

      final link = searchFolder.mountpoints.first;
      expect(link.id, id);
      expect(link.name, name);
      expect(link.ownerEmail, ownerEmail);
      expect(link.ownerAccountId, ownerAccountId);
      expect(link.remoteFolderId, remoteFolderId);
      expect(link.remoteUuid, remoteUuid);
      expect(link.remoteFolderName, remoteFolderName);
      expect(link.reminderEnabled, reminderEnabled);
      expect(link.broken, broken);
      expect(link, isA<Folder>());

      final search = searchFolder.searchFolders.first;
      expect(search.id, id);
      expect(search.name, name);
      expect(search.query, query);
      expect(search.sortBy, SearchSortBy.none);
      expect(search.types, types);
      expect(search, isA<Folder>());

      final retentionPolicy = searchFolder.retentionPolicy!;
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

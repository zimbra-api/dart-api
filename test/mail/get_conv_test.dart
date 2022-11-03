import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/address_type.dart';
import 'package:zimbra_api/src/common/enum/alarm_action.dart';
import 'package:zimbra_api/src/common/enum/alarm_related.dart';
import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/frequency.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/invite_type.dart';
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/common/enum/reply_type.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';
import 'package:zimbra_api/src/common/enum/week_day.dart';
import 'package:zimbra_api/src/common/type/attribute_name.dart';
import 'package:zimbra_api/src/mail/message/get_conv_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_conv_request.dart';
import 'package:zimbra_api/src/mail/type/add_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/conversation_spec.dart';
import 'package:zimbra_api/src/mail/type/exclude_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/recurrence_info.dart';

void main() {
  final faker = Faker();

  group('Get conversation tests', (() {
    test('Get conversation request', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final inlineRule = faker.lorem.word();
      final wantHtml = faker.randomGenerator.boolean();
      final maxInlinedLength = faker.randomGenerator.integer(100);
      final needCanExpand = faker.randomGenerator.boolean();

      final request = GetConvRequest(ConversationSpec(
        id: id,
        inlineRule: inlineRule,
        wantHtml: wantHtml,
        maxInlinedLength: maxInlinedLength,
        needCanExpand: needCanExpand,
        headers: [AttributeName(name: name)],
      ));
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetConvRequest': {
            '_jsns': 'urn:zimbraMail',
            'c': {
              'id': id,
              'fetch': inlineRule,
              'html': wantHtml,
              'max': maxInlinedLength,
              'needExp': needCanExpand,
              'header': [
                {
                  'n': name,
                }
              ],
            },
          }
        },
      });
    }));

    test('Get conversation response', (() {
      final id = faker.guid.guid();
      final uid = faker.guid.guid();
      final subject = faker.lorem.word();
      final section = faker.lorem.word();
      final name = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final num = faker.randomGenerator.integer(100);
      final totalSize = faker.randomGenerator.integer(100);
      final flags = faker.lorem.word();
      final tags = faker.randomGenerator.amount((_) => random.integer(10), 10, min: 5).join(',');
      final tagNames = faker.randomGenerator.amount((_) => random.string(10), 10, min: 5).join(',');

      final imapUid = faker.randomGenerator.integer(100);
      final calendarIntendedFor = faker.lorem.word();
      final origId = faker.guid.guid();
      final identityId = faker.guid.guid();
      final draftAccountId = faker.guid.guid();
      final draftAutoSendTime = faker.randomGenerator.integer(100);
      final sentDate = faker.date.dateTime().millisecondsSinceEpoch;
      final resentDate = faker.date.dateTime().millisecondsSinceEpoch;
      final part = faker.lorem.word();
      final fragment = faker.lorem.word();
      final messageIdHeader = faker.guid.guid();
      final inReplyTo = faker.internet.email();
      final size = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final folder = faker.guid.guid();
      final conversationId = faker.guid.guid();
      final revision = faker.randomGenerator.integer(100);
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequence = faker.randomGenerator.integer(100);

      final address = faker.internet.email();
      final display = faker.person.name();
      final personal = faker.lorem.word();
      final isGroup = faker.randomGenerator.boolean();
      final canExpandGroupMembers = faker.randomGenerator.boolean();

      final tzStdOffset = faker.randomGenerator.integer(100);
      final tzDayOffset = faker.randomGenerator.integer(100);
      final standardTZName = faker.lorem.word();
      final daylightTZName = faker.lorem.word();

      final month = faker.date.dateTime().month;
      final hour = faker.date.dateTime().hour;
      final minute = faker.date.dateTime().minute;
      final second = faker.date.dateTime().second;
      final dayOfMonth = faker.randomGenerator.integer(31, min: 1);
      final week = faker.randomGenerator.integer(4, min: 1);
      final dayOfWeek = faker.randomGenerator.integer(7, min: 1);

      final recurrenceRangeType = faker.randomGenerator.integer(3, min: 1);
      final attendee = faker.internet.email();
      final sentBy = faker.internet.email();
      final timezone = faker.lorem.word();
      final recurIdZ = faker.date.dateTime().toString();
      final recurrenceId = faker.date.dateTime().toString();
      final seq = faker.randomGenerator.integer(100);

      final category = faker.lorem.word();
      final comment = faker.lorem.word();
      final contact = faker.lorem.word();
      final latitude = faker.randomGenerator.decimal().toString();
      final longitude = faker.randomGenerator.decimal().toString();

      final displayName = faker.person.name();
      final dir = faker.lorem.word();
      final language = faker.address.countryCode();
      final cuType = faker.lorem.word();
      final role = faker.lorem.word();
      final member = faker.internet.email();
      final delegatedTo = faker.internet.email();
      final delegatedFrom = faker.internet.email();
      final utcTime = faker.date.dateTime().millisecond;
      final dateTimeString = faker.date.dateTime().toString();

      final durationNegative = faker.randomGenerator.boolean();
      final weeks = faker.randomGenerator.integer(100);
      final days = faker.randomGenerator.integer(100);
      final hours = faker.randomGenerator.integer(100);
      final minutes = faker.randomGenerator.integer(100);
      final seconds = faker.randomGenerator.integer(100);
      final repeatCount = faker.randomGenerator.integer(100);

      final contentType = faker.lorem.word();
      final content = faker.lorem.word();
      final summary = faker.guid.guid();
      final description = faker.lorem.word();
      final htmlDescription = faker.lorem.word();
      final binaryB64Data = faker.lorem.word();

      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);

      final partStat = faker.randomGenerator.element(ParticipationStatus.values);
      final componentNum = faker.randomGenerator.integer(100);
      final method = faker.lorem.word();
      final rsvp = faker.randomGenerator.boolean();
      final priority = faker.randomGenerator.integer(9).toString();
      final location = faker.address.streetAddress();
      final percentComplete = faker.randomGenerator.integer(100).toString();
      final completed = faker.date.dateTime().toString();
      final noBlob = faker.randomGenerator.boolean();
      final isOrganizer = faker.randomGenerator.boolean();
      final xUid = faker.guid.guid();
      final calItemId = faker.guid.guid();
      final deprecatedApptId = faker.guid.guid();
      final sequence = faker.randomGenerator.integer(100);
      final dateTime = faker.date.dateTime().millisecondsSinceEpoch;
      final calItemFolder = faker.lorem.word();
      final url = faker.internet.httpsUrl();
      final uri = faker.internet.uri('http');
      final isException = faker.randomGenerator.boolean();
      final isAllDay = faker.randomGenerator.boolean();
      final isDraft = faker.randomGenerator.boolean();
      final neverSent = faker.randomGenerator.boolean();
      final changes = faker.lorem.words(3).join(',');

      final contentDisposition = faker.lorem.word();
      final contentFilename = faker.lorem.word();
      final contentId = faker.guid.guid();
      final body = faker.randomGenerator.boolean();
      final truncatedContent = faker.randomGenerator.boolean();

      final data = {
        'Body': {
          'GetConvResponse': {
            '_jsns': 'urn:zimbraMail',
            'c': {
              'id': id,
              'n': num,
              'total': totalSize,
              'f': flags,
              't': tags,
              'tn': tagNames,
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
              'su': {'_content': subject},
              'm': [
                {
                  'id': id,
                  'i4uid': imapUid,
                  'cif': calendarIntendedFor,
                  'origid': origId,
                  'rt': ReplyType.replied.name,
                  'idnt': identityId,
                  'forAcct': draftAccountId,
                  'autoSendTime': draftAutoSendTime,
                  'sd': sentDate,
                  'rd': resentDate,
                  'part': part,
                  'fr': {'_content': fragment},
                  'e': [
                    {
                      'a': address,
                      'd': display,
                      'p': personal,
                      't': AddressType.from.name,
                      'isGroup': isGroup,
                      'exp': canExpandGroupMembers,
                    }
                  ],
                  'su': {'_content': subject},
                  'mid': {'_content': messageIdHeader},
                  'irt': inReplyTo,
                  's': size,
                  'd': date,
                  'l': folder,
                  'cid': conversationId,
                  'f': flags,
                  't': tags,
                  'tn': tagNames,
                  'rev': revision,
                  'md': changeDate,
                  'ms': modifiedSequence,
                  'inv': {
                    'type': InviteType.appt.name,
                    'tz': [
                      {
                        'id': id,
                        'stdoff': tzStdOffset,
                        'dayoff': tzDayOffset,
                        'standard': {
                          'mon': month,
                          'hour': hour,
                          'min': minute,
                          'sec': second,
                          'mday': dayOfMonth,
                          'week': week,
                          'wkday': dayOfWeek,
                        },
                        'daylight': {
                          'mon': month,
                          'hour': hour,
                          'min': minute,
                          'sec': second,
                          'mday': dayOfMonth,
                          'week': week,
                          'wkday': dayOfWeek,
                        },
                        'stdname': standardTZName,
                        'dayname': daylightTZName,
                      }
                    ],
                    'comp': {
                      'category': [
                        {'_content': category}
                      ],
                      'comment': [
                        {'_content': comment}
                      ],
                      'contact': [
                        {'_content': contact}
                      ],
                      'geo': {
                        'lat': latitude,
                        'lon': longitude,
                      },
                      'at': [
                        {
                          'a': address,
                          'url': url,
                          'd': displayName,
                          'sentBy': sentBy,
                          'dir': dir,
                          'lang': language,
                          'cutype': cuType,
                          'role': role,
                          'ptst': partStat.name,
                          'rsvp': rsvp,
                          'member': member,
                          'delegatedTo': delegatedTo,
                          'delegatedFrom': delegatedFrom,
                          'xparam': [
                            {
                              'name': name,
                              '_content': value,
                            }
                          ],
                        }
                      ],
                      'alarm': [
                        {
                          'action': AlarmAction.display.name,
                          'trigger': {
                            'abs': {
                              'd': dateTimeString,
                            },
                            'rel': {
                              'd': dateTimeString,
                            },
                          },
                          'repeat': {
                            'neg': durationNegative,
                            'w': weeks,
                            'd': days,
                            'h': hours,
                            'm': minutes,
                            's': seconds,
                            'related': AlarmRelated.start.name,
                            'count': repeatCount,
                          },
                          'desc': {'_content': description},
                          'attach': {
                            'uri': uri,
                            'ct': contentType,
                            '_content': binaryB64Data,
                          },
                          'summary': {'_content': summary},
                          'at': [
                            {
                              'a': address,
                              'url': url,
                              'd': displayName,
                              'sentBy': sentBy,
                              'dir': dir,
                              'lang': language,
                              'cutype': cuType,
                              'role': role,
                              'ptst': partStat.name,
                              'rsvp': rsvp,
                              'member': member,
                              'delegatedTo': delegatedTo,
                              'delegatedFrom': delegatedFrom,
                              'xparam': [
                                {
                                  'name': name,
                                  '_content': value,
                                }
                              ],
                            }
                          ],
                          'xprop': [
                            {
                              'name': name,
                              '_content': value,
                              'xparam': [
                                {
                                  'name': name,
                                  '_content': value,
                                }
                              ],
                            }
                          ],
                        }
                      ],
                      'xprop': [
                        {
                          'name': name,
                          '_content': value,
                          'xparam': [
                            {
                              'name': name,
                              '_content': value,
                            }
                          ],
                        }
                      ],
                      'fr': {'_content': fragment},
                      'desc': {'_content': description},
                      'descHtml': {'_content': htmlDescription},
                      'or': {
                        'a': address,
                        'url': url,
                        'd': displayName,
                        'sentBy': sentBy,
                        'dir': dir,
                        'lang': language,
                        'xparam': [
                          {
                            'name': name,
                            '_content': value,
                          }
                        ],
                      },
                      'recur': {
                        'add': [
                          {'add': {}}
                        ],
                        'exclude': [
                          {'exclude': {}}
                        ],
                        'except': [
                          {
                            'rangeType': recurrenceRangeType,
                            'recurId': recurrenceId,
                            'tz': timezone,
                            'ridZ': recurIdZ,
                            'add': {'add': []},
                            'exclude': {'exclude': []},
                          }
                        ],
                        'cancel': [
                          {
                            'rangeType': recurrenceRangeType,
                            'recurId': recurrenceId,
                            'tz': timezone,
                            'ridZ': recurIdZ,
                          }
                        ],
                        'dates': [
                          {
                            'tz': timezone,
                            'dtval': [
                              {
                                's': {
                                  'd': dateTimeString,
                                  'tz': timezone,
                                  'u': utcTime,
                                },
                                'e': {
                                  'd': dateTimeString,
                                  'tz': timezone,
                                  'u': utcTime,
                                },
                                'dur': {
                                  'neg': durationNegative,
                                  'w': weeks,
                                  'd': days,
                                  'h': hours,
                                  'm': minutes,
                                  's': seconds,
                                  'related': AlarmRelated.start.name,
                                  'count': repeatCount,
                                },
                              }
                            ],
                          }
                        ],
                        'rule': [
                          {
                            'freq': Frequency.second.name,
                            'until': {
                              'd': dateTimeString,
                            },
                            'count': {
                              'num': num,
                            },
                            'interval': {
                              'ival': ival,
                            },
                            'bysecond': {
                              'seclist': list,
                            },
                            'byminute': {
                              'minlist': list,
                            },
                            'byhour': {
                              'hrlist': list,
                            },
                            'byday': {
                              'wkday': [
                                {
                                  'day': WeekDay.sunday.name,
                                  'ordWk': ordWk,
                                }
                              ],
                            },
                            'bymonthday': {
                              'modaylist': list,
                            },
                            'byyearday': {
                              'yrdaylist': list,
                            },
                            'byweekno': {
                              'wklist': list,
                            },
                            'bymonth': {
                              'molist': list,
                            },
                            'bysetpos': {
                              'poslist': list,
                            },
                            'wkst': {
                              'day': WeekDay.sunday.name,
                            },
                            'rule-x-name': [
                              {
                                'name': name,
                                'value': value,
                              }
                            ],
                          }
                        ],
                      },
                      'exceptId': {
                        'd': dateTimeString,
                        'tz': timezone,
                        'rangeType': recurrenceRangeType,
                      },
                      's': {
                        'd': dateTimeString,
                        'tz': timezone,
                        'u': utcTime,
                      },
                      'e': {
                        'd': dateTimeString,
                        'tz': timezone,
                        'u': utcTime,
                      },
                      'dur': {
                        'neg': durationNegative,
                        'w': weeks,
                        'd': days,
                        'h': hours,
                        'm': minutes,
                        's': seconds,
                        'related': AlarmRelated.start.name,
                        'count': repeatCount,
                      },
                      'method': method,
                      'compNum': componentNum,
                      'rsvp': rsvp,
                      'priority': priority,
                      'name': name,
                      'loc': location,
                      'percentComplete': percentComplete,
                      'completed': completed,
                      'noBlob': noBlob,
                      'fba': FreeBusyStatus.free.name,
                      'fb': FreeBusyStatus.free.name,
                      'transp': Transparency.opaque.name,
                      'isOrg': isOrganizer,
                      'x_uid': xUid,
                      'uid': uid,
                      'seq': sequence,
                      'd': dateTime,
                      'calItemId': calItemId,
                      'apptId': deprecatedApptId,
                      'ciFolder': calItemFolder,
                      'status': InviteStatus.completed.name,
                      'class': InviteClass.public.name,
                      'url': url,
                      'ex': isException,
                      'ridZ': recurIdZ,
                      'allDay': isAllDay,
                      'draft': isDraft,
                      'neverSent': neverSent,
                      'changes': changes,
                    },
                    'replies': {
                      'reply': [
                        {
                          'rangeType': recurrenceRangeType,
                          'recurId': recurrenceId,
                          'seq': seq,
                          'd': date,
                          'at': attendee,
                          'sentBy': sentBy,
                          'ptst': partStat.name,
                          'tz': timezone,
                          'ridZ': recurIdZ,
                        }
                      ]
                    }
                  },
                  'header': [
                    {
                      'n': key,
                      '_content': value,
                    }
                  ],
                  'mp': [
                    {
                      'part': part,
                      'ct': contentType,
                      's': size,
                      'cd': contentDisposition,
                      'filename': contentFilename,
                      'ci': contentId,
                      'cl': location,
                      'body': body,
                      'truncated': truncatedContent,
                      'content': {'_content': content},
                      'mp': [
                        {
                          'part': part,
                          'ct': contentType,
                          's': size,
                          'cd': contentDisposition,
                          'filename': contentFilename,
                          'ci': contentId,
                          'cl': location,
                          'body': body,
                          'truncated': truncatedContent,
                          'content': {'_content': content},
                        }
                      ],
                    }
                  ],
                  'shr': [
                    {
                      'truncated': truncatedContent,
                      'content': {'_content': content},
                    }
                  ],
                  'dlSubs': [
                    {
                      'truncated': truncatedContent,
                      'content': {'_content': content},
                    }
                  ],
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
                }
              ],
              'chat': [
                {
                  'id': id,
                  'i4uid': imapUid,
                  'cif': calendarIntendedFor,
                  'origid': origId,
                  'rt': ReplyType.replied.name,
                  'idnt': identityId,
                  'forAcct': draftAccountId,
                  'autoSendTime': draftAutoSendTime,
                  'sd': sentDate,
                  'rd': resentDate,
                  'part': part,
                  'fr': {'_content': fragment},
                  'su': {'_content': subject},
                  'mid': {'_content': messageIdHeader},
                  'irt': inReplyTo,
                  's': size,
                  'd': date,
                  'l': folder,
                  'cid': conversationId,
                  'f': flags,
                  't': tags,
                  'tn': tagNames,
                  'rev': revision,
                  'md': changeDate,
                  'ms': modifiedSequence,
                }
              ],
            },
          }
        }
      };
      final envelope = GetConvEnvelope.fromMap(data);
      final response = envelope.getConvBody.getConvResponse!;
      final conv = response.conversation!;

      expect(conv.id, id);
      expect(conv.num, num);
      expect(conv.totalSize, totalSize);
      expect(conv.flags, flags);
      expect(conv.tags, tags);
      expect(conv.tagNames, tagNames);
      expect(conv.subject, subject);

      final meta = conv.metadatas.first;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);

      final msg = conv.messages.first;
      expect(msg.id, id);
      expect(msg.imapUid, imapUid);
      expect(msg.calendarIntendedFor, calendarIntendedFor);
      expect(msg.origId, origId);
      expect(msg.draftReplyType, ReplyType.replied);
      expect(msg.identityId, identityId);
      expect(msg.draftAccountId, draftAccountId);
      expect(msg.draftAutoSendTime, draftAutoSendTime);
      expect(msg.sentDate, sentDate);
      expect(msg.resentDate, resentDate);
      expect(msg.part, part);
      expect(msg.fragment, fragment);
      expect(msg.subject, subject);
      expect(msg.messageIdHeader, messageIdHeader);
      expect(msg.inReplyTo, inReplyTo);
      expect(msg.size, size);
      expect(msg.date, date);
      expect(msg.folder, folder);
      expect(msg.conversationId, conversationId);
      expect(msg.flags, flags);
      expect(msg.tags, tags);
      expect(msg.tagNames, tagNames);
      expect(msg.revision, revision);
      expect(msg.changeDate, changeDate);
      expect(msg.modifiedSequence, modifiedSequence);

      final header = msg.headers.first;
      expect(header.key, key);
      expect(header.value, value);

      final partInfo = msg.partInfos.first;
      expect(partInfo.part, part);
      expect(partInfo.contentType, contentType);
      expect(partInfo.size, size);
      expect(partInfo.contentDisposition, contentDisposition);
      expect(partInfo.contentFilename, contentFilename);
      expect(partInfo.contentId, contentId);
      expect(partInfo.location, location);
      expect(partInfo.body, body);
      expect(partInfo.truncatedContent, truncatedContent);
      expect(partInfo.content, content);

      final mimePart = partInfo.mimeParts.first;
      expect(mimePart.part, part);
      expect(mimePart.contentType, contentType);
      expect(mimePart.size, size);
      expect(mimePart.contentDisposition, contentDisposition);
      expect(mimePart.contentFilename, contentFilename);
      expect(mimePart.contentId, contentId);
      expect(mimePart.location, location);
      expect(mimePart.body, body);
      expect(mimePart.truncatedContent, truncatedContent);
      expect(mimePart.content, content);

      final shr = msg.shareNotifications.first;
      expect(shr.content, content);
      expect(shr.truncatedContent, truncatedContent);

      final dlSubs = msg.dlSubsNotifications.first;
      expect(dlSubs.content, content);
      expect(dlSubs.truncatedContent, truncatedContent);

      final msgMeta = msg.metadatas.first;
      expect(msgMeta.section, section);
      expect(msgMeta.keyValuePairs.first.key, key);
      expect(msgMeta.keyValuePairs.first.value, value);

      final invite = msg.invite!;
      expect(invite.calItemType, InviteType.appt);

      final tz = invite.timezones.first;
      expect(tz.id, id);
      expect(tz.tzStdOffset, tzStdOffset);
      expect(tz.tzDayOffset, tzDayOffset);
      expect(tz.standardTZName, standardTZName);
      expect(tz.daylightTZName, daylightTZName);

      final standard = tz.standardTzOnset!;
      expect(standard.month, month);
      expect(standard.hour, hour);
      expect(standard.minute, minute);
      expect(standard.second, second);
      expect(standard.dayOfMonth, dayOfMonth);
      expect(standard.week, week);
      expect(standard.dayOfWeek, dayOfWeek);

      final daylight = tz.daylightTzOnset!;
      expect(daylight.month, month);
      expect(daylight.hour, hour);
      expect(daylight.minute, minute);
      expect(daylight.second, second);
      expect(daylight.dayOfMonth, dayOfMonth);
      expect(daylight.week, week);
      expect(daylight.dayOfWeek, dayOfWeek);

      final reply = invite.calendarReplies.first;
      expect(reply.recurrenceRangeType, recurrenceRangeType);
      expect(reply.recurrenceId, recurrenceId);
      expect(reply.seq, seq);
      expect(reply.date, date);
      expect(reply.attendee, attendee);
      expect(reply.sentBy, sentBy);
      expect(reply.partStat, partStat);
      expect(reply.timezone, timezone);
      expect(reply.recurIdZ, recurIdZ);

      final comp = invite.inviteComponent!;
      expect(comp.method, method);
      expect(comp.componentNum, componentNum);
      expect(comp.rsvp, rsvp);
      expect(comp.priority, priority);
      expect(comp.name, name);
      expect(comp.location, location);
      expect(comp.percentComplete, percentComplete);
      expect(comp.completed, completed);
      expect(comp.noBlob, noBlob);
      expect(comp.freeBusyActual, FreeBusyStatus.free);
      expect(comp.freeBusy, FreeBusyStatus.free);
      expect(comp.transparency, Transparency.opaque);
      expect(comp.isOrganizer, isOrganizer);
      expect(comp.xUid, xUid);
      expect(comp.uid, uid);
      expect(comp.sequence, sequence);
      expect(comp.dateTime, dateTime);
      expect(comp.calItemId, calItemId);
      expect(comp.deprecatedApptId, deprecatedApptId);
      expect(comp.calItemFolder, calItemFolder);
      expect(comp.status, InviteStatus.completed);
      expect(comp.calClass, InviteClass.public);
      expect(comp.url, url);
      expect(comp.isException, isException);
      expect(comp.recurIdZ, recurIdZ);
      expect(comp.isAllDay, isAllDay);
      expect(comp.isDraft, isDraft);
      expect(comp.neverSent, neverSent);
      expect(comp.changes, changes);

      expect(comp.fragment, fragment);
      expect(comp.description, description);
      expect(comp.htmlDescription, htmlDescription);

      expect(comp.categories.first, category);
      expect(comp.comments.first, comment);
      expect(comp.contacts.first, contact);

      final geo = comp.geo!;
      expect(geo.latitude, latitude);
      expect(geo.longitude, longitude);

      final compAt = comp.attendees.first;
      expect(compAt.address, address);
      expect(compAt.url, url);
      expect(compAt.displayName, displayName);
      expect(compAt.sentBy, sentBy);
      expect(compAt.dir, dir);
      expect(compAt.language, language);
      expect(compAt.cuType, cuType);
      expect(compAt.role, role);
      expect(compAt.partStat, partStat);
      expect(compAt.rsvp, rsvp);
      expect(compAt.member, member);
      expect(compAt.delegatedTo, delegatedTo);
      expect(compAt.delegatedFrom, delegatedFrom);
      expect(compAt.xParams.first.name, name);
      expect(compAt.xParams.first.value, value);

      final alarm = comp.alarms.first;
      expect(alarm.action, AlarmAction.display);
      expect(alarm.description, description);
      expect(alarm.summary, summary);
      expect(alarm.attach!.uri, uri);
      expect(alarm.attach!.contentType, contentType);
      expect(alarm.attach!.binaryB64Data, binaryB64Data);

      final alarmAt = alarm.attendees.first;
      expect(alarmAt.address, address);
      expect(alarmAt.url, url);
      expect(alarmAt.displayName, displayName);
      expect(alarmAt.sentBy, sentBy);
      expect(alarmAt.dir, dir);
      expect(alarmAt.language, language);
      expect(alarmAt.cuType, cuType);
      expect(alarmAt.role, role);
      expect(alarmAt.partStat, partStat);
      expect(alarmAt.rsvp, rsvp);
      expect(alarmAt.member, member);
      expect(alarmAt.delegatedTo, delegatedTo);
      expect(alarmAt.delegatedFrom, delegatedFrom);
      expect(alarmAt.xParams.first.name, name);
      expect(alarmAt.xParams.first.value, value);

      final alarmXProp = alarm.xProps.first;
      expect(alarmXProp.name, name);
      expect(alarmXProp.value, value);
      expect(alarmXProp.xParams.first.name, name);
      expect(alarmXProp.xParams.first.value, value);

      final compXProp = comp.xProps.first;
      expect(compXProp.name, name);
      expect(compXProp.value, value);
      expect(compXProp.xParams.first.name, name);
      expect(compXProp.xParams.first.value, value);

      final organizer = comp.organizer!;
      expect(organizer.address, address);
      expect(organizer.url, url);
      expect(organizer.displayName, displayName);
      expect(organizer.sentBy, sentBy);
      expect(organizer.dir, dir);
      expect(organizer.language, language);
      expect(organizer.xParams.first.name, name);
      expect(organizer.xParams.first.value, value);

      final recurrence = comp.recurrence!;
      expect(recurrence.add.first, isA<AddRecurrenceInfo>());
      expect(recurrence.exclude.first, isA<ExcludeRecurrenceInfo>());

      final except = recurrence.except.first;
      expect(except.recurrenceRangeType, recurrenceRangeType);
      expect(except.recurrenceId, recurrenceId);
      expect(except.timezone, timezone);
      expect(except.recurIdZ, recurIdZ);
      expect(except.add, isA<RecurrenceInfo>());
      expect(except.exclude, isA<RecurrenceInfo>());

      final cancel = recurrence.cancel.first;
      expect(cancel.recurrenceRangeType, recurrenceRangeType);
      expect(cancel.recurrenceId, recurrenceId);
      expect(cancel.timezone, timezone);
      expect(cancel.recurIdZ, recurIdZ);

      final dates = recurrence.dates.first;
      expect(dates.timezone, timezone);

      final startTime = dates.dtVals.first.startTime!;
      expect(startTime.dateTime, dateTimeString);
      expect(startTime.timezone, timezone);
      expect(startTime.utcTime, utcTime);

      final endTime = dates.dtVals.first.endTime!;
      expect(endTime.dateTime, dateTimeString);
      expect(endTime.timezone, timezone);
      expect(endTime.utcTime, utcTime);

      final duration = dates.dtVals.first.duration!;
      expect(duration.durationNegative, durationNegative);
      expect(duration.weeks, weeks);
      expect(duration.days, days);
      expect(duration.hours, hours);
      expect(duration.minutes, minutes);
      expect(duration.seconds, seconds);
      expect(duration.related, AlarmRelated.start);
      expect(duration.repeatCount, repeatCount);

      final simple = recurrence.simple.first;
      expect(simple.until!.dateTime, dateTimeString);
      expect(simple.count!.num, num);
      expect(simple.interval!.ival, ival);
      expect(simple.bySecond!.list, list);
      expect(simple.byMinute!.list, list);
      expect(simple.byHour!.list, list);
      expect(simple.byDay!.days.first.day, WeekDay.sunday);
      expect(simple.byDay!.days.first.ordWk, ordWk);
      expect(simple.byMonthDay!.list, list);
      expect(simple.byYearDay!.list, list);
      expect(simple.byWeekNo!.list, list);
      expect(simple.byMonth!.list, list);
      expect(simple.bySetPose!.list, list);
      expect(simple.weekStart!.day, WeekDay.sunday);
      expect(simple.xNames.first.name, name);
      expect(simple.xNames.first.value, value);

      final exceptionId = comp.exceptionId!;
      expect(exceptionId.dateTime, dateTimeString);
      expect(exceptionId.timezone, timezone);
      expect(exceptionId.recurrenceRangeType, recurrenceRangeType);

      final dtStart = comp.dtStart!;
      expect(dtStart.dateTime, dateTimeString);
      expect(dtStart.timezone, timezone);
      expect(dtStart.utcTime, utcTime);

      final dtEnd = comp.dtEnd!;
      expect(dtEnd.dateTime, dateTimeString);
      expect(dtEnd.timezone, timezone);
      expect(dtEnd.utcTime, utcTime);

      final inviteDuration = comp.duration!;
      expect(inviteDuration.durationNegative, durationNegative);
      expect(inviteDuration.weeks, weeks);
      expect(inviteDuration.days, days);
      expect(inviteDuration.hours, hours);
      expect(inviteDuration.minutes, minutes);
      expect(inviteDuration.seconds, seconds);
      expect(inviteDuration.related, AlarmRelated.start);
      expect(inviteDuration.repeatCount, repeatCount);

      final chat = conv.chatMessages.first;
      expect(chat.id, id);
      expect(chat.imapUid, imapUid);
      expect(chat.calendarIntendedFor, calendarIntendedFor);
      expect(chat.origId, origId);
      expect(chat.draftReplyType, ReplyType.replied);
      expect(chat.identityId, identityId);
      expect(chat.draftAccountId, draftAccountId);
      expect(chat.draftAutoSendTime, draftAutoSendTime);
      expect(chat.sentDate, sentDate);
      expect(chat.resentDate, resentDate);
      expect(chat.part, part);
      expect(chat.fragment, fragment);
      expect(chat.subject, subject);
      expect(chat.messageIdHeader, messageIdHeader);
      expect(chat.inReplyTo, inReplyTo);
      expect(chat.size, size);
      expect(chat.date, date);
      expect(chat.folder, folder);
      expect(chat.conversationId, conversationId);
      expect(chat.flags, flags);
      expect(chat.tags, tags);
      expect(chat.tagNames, tagNames);
      expect(chat.revision, revision);
      expect(chat.changeDate, changeDate);
      expect(chat.modifiedSequence, modifiedSequence);
    }));
  }));
}

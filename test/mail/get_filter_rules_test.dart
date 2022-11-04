import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/address_part.dart';
import 'package:zimbra_api/src/common/enum/comparison_comparator.dart';
import 'package:zimbra_api/src/common/enum/count_comparison.dart';
import 'package:zimbra_api/src/common/enum/date_comparison.dart';
import 'package:zimbra_api/src/common/enum/filter_condition.dart';
import 'package:zimbra_api/src/common/enum/filter_flag_name.dart';
import 'package:zimbra_api/src/common/enum/importance.dart';
import 'package:zimbra_api/src/common/enum/logging_level.dart';
import 'package:zimbra_api/src/common/enum/match_type.dart';
import 'package:zimbra_api/src/common/enum/number_comparison.dart';
import 'package:zimbra_api/src/common/enum/relational_comparator.dart';
import 'package:zimbra_api/src/common/enum/string_comparison.dart';
import 'package:zimbra_api/src/common/enum/value_comparison.dart';
import 'package:zimbra_api/src/common/enum/where_setting.dart';
import 'package:zimbra_api/src/mail/message/get_filter_rules_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_filter_rules_request.dart';
import 'package:zimbra_api/src/mail/message/get_filter_rules_response.dart';
import 'package:zimbra_api/src/mail/type/nested_rule.dart';

void main() {
  final faker = Faker();

  group('Get filter rules tests', (() {
    test('Get filter rules request', (() {
      final request = GetFilterRulesRequest();
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetFilterRulesRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Get filter rules response', (() {
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final active = faker.randomGenerator.boolean();
      final index = faker.randomGenerator.integer(100);
      final negative = faker.randomGenerator.boolean();
      final caseSensitive = faker.randomGenerator.boolean();
      final header = faker.lorem.word();
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final time = faker.date.dateTime().toString();
      final method = faker.lorem.word();
      final size = faker.lorem.word();

      final folder = faker.lorem.word();
      final copy = faker.randomGenerator.boolean();
      final tag = faker.lorem.word();
      final address = faker.internet.email();
      final content = faker.lorem.word();
      final subject = faker.lorem.word();
      final maxBodySize = faker.randomGenerator.integer(100);
      final origHeaders = faker.lorem.word();
      final from = faker.internet.email();
      final importance = faker.lorem.word();
      final options = faker.lorem.word();
      final message = faker.lorem.word();
      final last = faker.randomGenerator.boolean();
      final offset = faker.randomGenerator.integer(100);
      final countComparator = faker.randomGenerator.boolean();
      final valueComparator = faker.randomGenerator.boolean();

      final data = {
        'Body': {
          'GetFilterRulesResponse': {
            '_jsns': 'urn:zimbraMail',
            'filterRules': [
              {
                'filterRule': [
                  {
                    'name': name,
                    'active': active,
                    'filterVariables': [
                      {
                        'index': index,
                        'filterVariable': [
                          {
                            'name': name,
                            'value': value,
                          }
                        ],
                      }
                    ],
                    'filterTests': [
                      {
                        'condition': FilterCondition.allof.name,
                        'addressBookTest': [
                          {
                            'header': header,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'addressTest': [
                          {
                            'header': header,
                            'part': AddressPart.all.name,
                            'stringComparison': StringComparison.contains.name,
                            'caseSensitive': caseSensitive,
                            'value': value,
                            'valueComparison': ValueComparison.equal.name,
                            'countComparison': CountComparison.equal.name,
                            'valueComparisonComparator': ComparisonComparator.asciiNumeric.name,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'envelopeTest': [
                          {
                            'header': header,
                            'part': AddressPart.all.name,
                            'stringComparison': StringComparison.contains.name,
                            'caseSensitive': caseSensitive,
                            'value': value,
                            'valueComparison': ValueComparison.equal.name,
                            'countComparison': CountComparison.equal.name,
                            'valueComparisonComparator': ComparisonComparator.asciiNumeric.name,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'attachmentTest': [
                          {
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'bodyTest': [
                          {
                            'value': value,
                            'caseSensitive': caseSensitive,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'bulkTest': [
                          {
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'contactRankingTest': [
                          {
                            'header': header,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'conversationTest': [
                          {
                            'where': WhereSetting.started.name,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'currentDayOfWeekTest': [
                          {
                            'value': value,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'currentTimeTest': [
                          {
                            'dateComparison': DateComparison.before.name,
                            'time': time,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'dateTest': [
                          {
                            'dateComparison': DateComparison.before.name,
                            'date': date,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'facebookTest': [
                          {
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'flaggedTest': [
                          {
                            'flagName': FilterFlagName.flagged.name,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'headerExistsTest': [
                          {
                            'header': header,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'headerTest': [
                          {
                            'header': header,
                            'stringComparison': StringComparison.contains.name,
                            'valueComparison': ValueComparison.equal.name,
                            'countComparison': CountComparison.equal.name,
                            'valueComparisonComparator': ComparisonComparator.asciiNumeric.name,
                            'value': value,
                            'caseSensitive': caseSensitive,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'importanceTest': [
                          {
                            'imp': Importance.normal.name,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'inviteTest': [
                          {
                            'method': [
                              {'_content': method}
                            ],
                            'index': index,
                            'negative': negative,
                          },
                        ],
                        'linkedinTest': [
                          {
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'listTest': [
                          {
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'meTest': [
                          {
                            'header': header,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'mimeHeaderTest': [
                          {
                            'header': header,
                            'stringComparison': StringComparison.contains.name,
                            'value': value,
                            'caseSensitive': caseSensitive,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'sizeTest': [
                          {
                            'numberComparison': NumberComparison.over.name,
                            's': size,
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'socialcastTest': [
                          {
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'trueTest': [
                          {
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'twitterTest': [
                          {
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'communityRequestsTest': [
                          {
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'communityContentTest': [
                          {
                            'index': index,
                            'negative': negative,
                          }
                        ],
                        'communityConnectionsTest': [
                          {
                            'index': index,
                            'negative': negative,
                          }
                        ],
                      }
                    ],
                    'filterActions': [
                      {
                        'filterVariables': [
                          {
                            'index': index,
                            'filterVariable': [
                              {
                                'name': name,
                                'value': value,
                              }
                            ],
                          }
                        ],
                        'actionKeep': [
                          {
                            'index': index,
                          }
                        ],
                        'actionDiscard': [
                          {
                            'index': index,
                          }
                        ],
                        'actionFileInto': [
                          {
                            'folderPath': folder,
                            'copy': copy,
                            'index': index,
                          }
                        ],
                        'actionFlag': [
                          {
                            'flagName': FilterFlagName.flagged.name,
                            'index': index,
                          }
                        ],
                        'actionTag': [
                          {
                            'tagName': tag,
                            'index': index,
                          }
                        ],
                        'actionRedirect': [
                          {
                            'a': address,
                            'copy': copy,
                            'index': index,
                          }
                        ],
                        'actionReply': [
                          {
                            'content': {'_content': content},
                            'index': index,
                          }
                        ],
                        'actionNotify': [
                          {
                            'a': address,
                            'su': subject,
                            'maxBodySize': maxBodySize,
                            'content': {'_content': content},
                            'origHeaders': origHeaders,
                            'index': index,
                          }
                        ],
                        'actionRFCCompliantNotify': [
                          {
                            'from': from,
                            'importance': importance,
                            'options': options,
                            'message': message,
                            'method': {'_content': method},
                            'index': index,
                          }
                        ],
                        'actionStop': [
                          {
                            'index': index,
                          }
                        ],
                        'actionReject': [
                          {
                            '_content': content,
                            'index': index,
                          }
                        ],
                        'actionEreject': [
                          {
                            '_content': content,
                            'index': index,
                          }
                        ],
                        'actionLog': [
                          {
                            'level': LoggingLevel.info.name,
                            '_content': content,
                            'index': index,
                          }
                        ],
                        'actionAddheader': [
                          {
                            'headerName': {'_content': header},
                            'headerValue': {'_content': value},
                            'last': last,
                            'index': index,
                          }
                        ],
                        'actionDeleteheader': [
                          {
                            'last': last,
                            'offset': offset,
                            'test': {
                              'matchType': MatchType.value.name,
                              'countComparator': countComparator,
                              'valueComparator': valueComparator,
                              'relationalComparator': RelationalComparator.equal.name,
                              'comparator': ComparisonComparator.asciiNumeric.name,
                              'headerName': {'_content': header},
                              'headerValue': [
                                {'_content': value}
                              ],
                            },
                            'index': index,
                          }
                        ],
                        'actionReplaceheader': [
                          {
                            'newName': {'_content': name},
                            'newValue': {'_content': value},
                            'last': last,
                            'offset': offset,
                            'test': {
                              'matchType': MatchType.value.name,
                              'countComparator': countComparator,
                              'valueComparator': valueComparator,
                              'relationalComparator': RelationalComparator.equal.name,
                              'comparator': ComparisonComparator.asciiNumeric.name,
                              'headerName': {'_content': header},
                              'headerValue': [
                                {'_content': value}
                              ],
                            },
                            'index': index,
                          }
                        ],
                      }
                    ],
                    'nestedRule': {
                      'filterVariables': {
                        'index': index,
                        'filterVariable': [
                          {
                            'name': name,
                            'value': value,
                          }
                        ],
                      },
                      'filterTests': {
                        'condition': FilterCondition.allof.name,
                      },
                      'filterActions': {
                        'filterVariables': [
                          {
                            'index': index,
                            'filterVariable': [
                              {
                                'name': name,
                                'value': value,
                              }
                            ],
                          }
                        ]
                      },
                      'nestedRule': {'nestedRule': null},
                    },
                  }
                ]
              }
            ],
          }
        }
      };
      final envelope = GetFilterRulesEnvelope.fromMap(data);
      final response = envelope.body.response as GetFilterRulesResponse;
      final filterRule = response.filterRules.first;

      expect(filterRule.name, name);
      expect(filterRule.active, active);

      final filterVariables = filterRule.filterVariables!;
      expect(filterVariables.index, index);
      expect(filterVariables.variables.first.name, name);
      expect(filterVariables.variables.first.value, value);

      final filterTests = filterRule.filterTests!;
      expect(filterTests.condition, FilterCondition.allof);

      final addressBookTest = filterTests.addressBookTests.first;
      expect(addressBookTest.header, header);
      expect(addressBookTest.index, index);
      expect(addressBookTest.negative, negative);

      final addressTest = filterTests.addressTests.first;
      expect(addressTest.header, header);
      expect(addressTest.part, AddressPart.all);
      expect(addressTest.stringComparison, StringComparison.contains);
      expect(addressTest.caseSensitive, caseSensitive);
      expect(addressTest.value, value);
      expect(addressTest.valueComparison, ValueComparison.equal);
      expect(addressTest.countComparison, CountComparison.equal);
      expect(addressTest.valueComparisonComparator, ComparisonComparator.asciiNumeric);
      expect(addressTest.index, index);
      expect(addressTest.negative, negative);

      final envelopeTest = filterTests.envelopeTests.first;
      expect(envelopeTest.header, header);
      expect(envelopeTest.part, AddressPart.all);
      expect(envelopeTest.stringComparison, StringComparison.contains);
      expect(envelopeTest.caseSensitive, caseSensitive);
      expect(addressTest.value, value);
      expect(envelopeTest.valueComparison, ValueComparison.equal);
      expect(envelopeTest.countComparison, CountComparison.equal);
      expect(envelopeTest.valueComparisonComparator, ComparisonComparator.asciiNumeric);
      expect(envelopeTest.index, index);
      expect(envelopeTest.negative, negative);

      final attachmentTest = filterTests.attachmentTests.first;
      expect(attachmentTest.index, index);
      expect(attachmentTest.negative, negative);

      final bodyTest = filterTests.bodyTests.first;
      expect(bodyTest.value, value);
      expect(bodyTest.caseSensitive, caseSensitive);
      expect(bodyTest.index, index);
      expect(bodyTest.negative, negative);

      final bulkTest = filterTests.bulkTests.first;
      expect(bulkTest.index, index);
      expect(bulkTest.negative, negative);

      final contactRankingTest = filterTests.contactRankingTests.first;
      expect(contactRankingTest.header, header);
      expect(contactRankingTest.index, index);
      expect(contactRankingTest.negative, negative);

      final conversationTest = filterTests.conversationTests.first;
      expect(conversationTest.where, WhereSetting.started);
      expect(conversationTest.index, index);
      expect(conversationTest.negative, negative);

      final currentDayOfWeekTest = filterTests.currentDayOfWeekTests.first;
      expect(currentDayOfWeekTest.values, value);
      expect(currentDayOfWeekTest.index, index);
      expect(currentDayOfWeekTest.negative, negative);

      final currentTimeTest = filterTests.currentTimeTests.first;
      expect(currentTimeTest.dateComparison, DateComparison.before);
      expect(currentTimeTest.time, time);
      expect(currentTimeTest.index, index);
      expect(currentTimeTest.negative, negative);

      final dateTest = filterTests.dateTests.first;
      expect(dateTest.dateComparison, DateComparison.before);
      expect(dateTest.date, date);
      expect(dateTest.index, index);
      expect(dateTest.negative, negative);

      final facebookTest = filterTests.facebookTests.first;
      expect(facebookTest.index, index);
      expect(facebookTest.negative, negative);

      final flaggedTest = filterTests.flaggedTests.first;
      expect(flaggedTest.flag, FilterFlagName.flagged);
      expect(flaggedTest.index, index);
      expect(flaggedTest.negative, negative);

      final headerExistsTest = filterTests.headerExistsTests.first;
      expect(headerExistsTest.header, header);
      expect(headerExistsTest.index, index);
      expect(headerExistsTest.negative, negative);

      final headerTest = filterTests.headerTests.first;
      expect(headerTest.headers, header);
      expect(headerTest.stringComparison, StringComparison.contains);
      expect(headerTest.valueComparison, ValueComparison.equal);
      expect(headerTest.countComparison, CountComparison.equal);
      expect(headerTest.valueComparisonComparator, ComparisonComparator.asciiNumeric);
      expect(headerTest.value, value);
      expect(headerTest.caseSensitive, caseSensitive);
      expect(headerTest.index, index);
      expect(headerTest.negative, negative);

      final importanceTest = filterTests.importanceTests.first;
      expect(importanceTest.importance, Importance.normal);
      expect(importanceTest.index, index);
      expect(importanceTest.negative, negative);

      final inviteTest = filterTests.inviteTests.first;
      expect(inviteTest.methods.first, method);
      expect(inviteTest.index, index);
      expect(inviteTest.negative, negative);

      final linkedinTest = filterTests.linkedinTests.first;
      expect(linkedinTest.index, index);
      expect(linkedinTest.negative, negative);

      final listTest = filterTests.listTests.first;
      expect(listTest.index, index);
      expect(listTest.negative, negative);

      final meTest = filterTests.meTests.first;
      expect(meTest.header, header);
      expect(meTest.index, index);
      expect(meTest.negative, negative);

      final mimeHeaderTest = filterTests.mimeHeaderTests.first;
      expect(mimeHeaderTest.headers, header);
      expect(mimeHeaderTest.stringComparison, StringComparison.contains);
      expect(mimeHeaderTest.value, value);
      expect(mimeHeaderTest.caseSensitive, caseSensitive);
      expect(mimeHeaderTest.index, index);
      expect(mimeHeaderTest.negative, negative);

      final sizeTest = filterTests.sizeTests.first;
      expect(sizeTest.numberComparison, NumberComparison.over);
      expect(sizeTest.size, size);
      expect(sizeTest.index, index);
      expect(sizeTest.negative, negative);

      final socialcastTest = filterTests.socialcastTests.first;
      expect(socialcastTest.index, index);
      expect(socialcastTest.negative, negative);

      final trueTest = filterTests.trueTests.first;
      expect(trueTest.index, index);
      expect(trueTest.negative, negative);

      final twitterTest = filterTests.twitterTests.first;
      expect(twitterTest.index, index);
      expect(twitterTest.negative, negative);

      final communityRequestsTest = filterTests.communityRequestsTests.first;
      expect(communityRequestsTest.index, index);
      expect(communityRequestsTest.negative, negative);

      final communityContentTest = filterTests.communityContentTests.first;
      expect(communityContentTest.index, index);
      expect(communityContentTest.negative, negative);

      final communityConnectionsTest = filterTests.communityConnectionsTests.first;
      expect(communityConnectionsTest.index, index);
      expect(communityConnectionsTest.negative, negative);

      final filterActions = filterRule.filterActions!;
      final filterVars = filterActions.filterVariables.first;
      expect(filterVars.index, index);
      expect(filterVars.variables.first.name, name);
      expect(filterVars.variables.first.value, value);

      final actionKeep = filterActions.keepActions.first;
      expect(actionKeep.index, index);

      final actionDiscard = filterActions.discardActions.first;
      expect(actionDiscard.index, index);

      final actionFileInto = filterActions.fileIntoActions.first;
      expect(actionFileInto.folder, folder);
      expect(actionFileInto.copy, copy);
      expect(actionFileInto.index, index);

      final actionFlag = filterActions.flagActions.first;
      expect(actionFlag.flag, FilterFlagName.flagged);
      expect(actionFlag.index, index);

      final actionTag = filterActions.tagActions.first;
      expect(actionTag.tag, tag);
      expect(actionTag.index, index);

      final actionRedirect = filterActions.redirectActions.first;
      expect(actionRedirect.address, address);
      expect(actionRedirect.copy, copy);
      expect(actionRedirect.index, index);

      final actionReply = filterActions.replyActions.first;
      expect(actionReply.content, content);
      expect(actionReply.index, index);

      final actionNotify = filterActions.notifyActions.first;
      expect(actionNotify.address, address);
      expect(actionNotify.subject, subject);
      expect(actionNotify.maxBodySize, maxBodySize);
      expect(actionNotify.content, content);
      expect(actionNotify.origHeaders, origHeaders);
      expect(actionNotify.index, index);

      final actionRFC = filterActions.rfcCompliantNotifyActions.first;
      expect(actionRFC.from, from);
      expect(actionRFC.importance, importance);
      expect(actionRFC.options, options);
      expect(actionRFC.message, message);
      expect(actionRFC.method, method);
      expect(actionRFC.index, index);

      final actionStop = filterActions.stopActions.first;
      expect(actionStop.index, index);

      final actionReject = filterActions.rejectActions.first;
      expect(actionReject.content, content);
      expect(actionReject.index, index);

      final actionEreject = filterActions.erejectActions.first;
      expect(actionEreject.content, content);
      expect(actionEreject.index, index);

      final actionLog = filterActions.logActions.first;
      expect(actionLog.level, LoggingLevel.info);
      expect(actionLog.content, content);
      expect(actionLog.index, index);

      final actionAddheader = filterActions.addheaderActions.first;
      expect(actionAddheader.headerName, header);
      expect(actionAddheader.headerValue, value);
      expect(actionAddheader.last, last);
      expect(actionAddheader.index, index);

      final actionDeleteheader = filterActions.deleteheaderActions.first;
      expect(actionDeleteheader.last, last);
      expect(actionDeleteheader.offset, offset);
      expect(actionDeleteheader.index, index);

      final testDeleteheader = actionDeleteheader.test!;
      expect(testDeleteheader.matchType, MatchType.value);
      expect(testDeleteheader.countComparator, countComparator);
      expect(testDeleteheader.valueComparator, valueComparator);
      expect(testDeleteheader.relationalComparator, RelationalComparator.equal);
      expect(testDeleteheader.comparator, ComparisonComparator.asciiNumeric);
      expect(testDeleteheader.headerName, header);
      expect(testDeleteheader.headerValue.first, value);

      final actionReplaceheader = filterActions.replaceheaderActions.first;
      expect(actionReplaceheader.newName, name);
      expect(actionReplaceheader.newValue, value);
      expect(actionReplaceheader.last, last);
      expect(actionReplaceheader.offset, offset);
      expect(actionReplaceheader.index, index);

      final testReplaceheader = actionReplaceheader.test!;
      expect(testReplaceheader.matchType, MatchType.value);
      expect(testReplaceheader.countComparator, countComparator);
      expect(testReplaceheader.valueComparator, valueComparator);
      expect(testReplaceheader.relationalComparator, RelationalComparator.equal);
      expect(testReplaceheader.comparator, ComparisonComparator.asciiNumeric);
      expect(testReplaceheader.headerName, header);
      expect(testReplaceheader.headerValue.first, value);

      final nestedRule = filterRule.child!;
      expect(nestedRule.child, isNotNull);
      expect(nestedRule.child, isA<NestedRule>());

      final nestedFilterVars = nestedRule.filterVariables!;
      expect(nestedFilterVars.index, index);
      expect(nestedFilterVars.variables.first.name, name);
      expect(nestedFilterVars.variables.first.value, value);

      final nestedFilterTests = nestedRule.filterTests!;
      expect(nestedFilterTests.condition, FilterCondition.allof);

      final nestedFilterActions = nestedRule.filterActions!;
      final nestedFAFilterVars = nestedFilterActions.filterVariables.first;
      expect(nestedFAFilterVars.index, index);
      expect(nestedFAFilterVars.variables.first.name, name);
      expect(nestedFAFilterVars.variables.first.value, value);
    }));
  }));
}

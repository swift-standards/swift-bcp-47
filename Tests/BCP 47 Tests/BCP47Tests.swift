// BCP47Tests.swift
// BCP 47 Tests

import Testing
@testable import BCP_47
import Foundation

@Suite("BCP 47 Language Tags")
struct BCP47Tests {

    // MARK: - Basic Usage via BCP47 namespace

    @Test
    func `BCP47: Simple language codes work via BCP47 namespace`() throws {
        let en = try BCP47.LanguageTag("en")
        #expect(en.value == "en")
        #expect(en.language.description == "en")

        let fr = try BCP47.LanguageTag("fr")
        #expect(fr.language.description == "fr")

        let de = try BCP47.LanguageTag("de")
        #expect(de.language.description == "de")
    }

    @Test
    func `BCP47: Language with region via BCP47 namespace`() throws {
        let enUS = try BCP47.LanguageTag("en-US")
        #expect(enUS.value == "en-US")
        #expect(enUS.language.description == "en")
    }

    @Test
    func `BCP47: Language with script via BCP47 namespace`() throws {
        let zhHans = try BCP47.LanguageTag("zh-Hans")
        #expect(zhHans.value == "zh-Hans")
        #expect(zhHans.language.description == "zh")
    }

    @Test
    func `BCP47: Complex tags via BCP47 namespace`() throws {
        let zhHansCN = try BCP47.LanguageTag("zh-Hans-CN")
        #expect(zhHansCN.value == "zh-Hans-CN")
        #expect(zhHansCN.language.description == "zh")
    }

    // MARK: - Error Handling via BCP47 namespace

    @Test
    func `BCP47: Errors work via BCP47 namespace`() {
        #expect(throws: BCP47.Error.emptyTag) {
            try BCP47.LanguageTag("")
        }

        #expect(throws: BCP47.Error.invalidLanguageSubtag("e")) {
            try BCP47.LanguageTag("e")
        }
    }

    // MARK: - Verify RFC_5646 is also accessible

    @Test
    func `BCP47: RFC_5646 types are accessible`() throws {
        // BCP 47 re-exports RFC_5646, so both should work
        let tag1 = try BCP47.LanguageTag("en-US")
        let tag2 = try RFC_5646.LanguageTag("en-US")
        #expect(tag1 == tag2)
    }

    @Test
    func `BCP47: Codable round-trip via BCP47 namespace`() throws {
        let original = try BCP47.LanguageTag("zh-Hans-CN")
        let encoder = JSONEncoder()
        let data = try encoder.encode(original)
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(BCP47.LanguageTag.self, from: data)
        #expect(decoded == original)
        #expect(decoded.value == "zh-Hans-CN")
    }

    // MARK: - Real World Examples

    @Test
    func `BCP47: Real world language tags`() throws {
        // English variants
        _ = try BCP47.LanguageTag("en")
        _ = try BCP47.LanguageTag("en-US")
        _ = try BCP47.LanguageTag("en-GB")
        _ = try BCP47.LanguageTag("en-AU")
        _ = try BCP47.LanguageTag("en-CA")

        // Chinese variants
        _ = try BCP47.LanguageTag("zh")
        _ = try BCP47.LanguageTag("zh-Hans")
        _ = try BCP47.LanguageTag("zh-Hant")
        _ = try BCP47.LanguageTag("zh-Hans-CN")
        _ = try BCP47.LanguageTag("zh-Hant-TW")
        _ = try BCP47.LanguageTag("zh-Hant-HK")

        // Serbian variants
        _ = try BCP47.LanguageTag("sr")
        _ = try BCP47.LanguageTag("sr-Cyrl")
        _ = try BCP47.LanguageTag("sr-Latn")
        _ = try BCP47.LanguageTag("sr-Cyrl-RS")
        _ = try BCP47.LanguageTag("sr-Latn-RS")

        // Others
        _ = try BCP47.LanguageTag("ja-JP")
        _ = try BCP47.LanguageTag("ko-KR")
        _ = try BCP47.LanguageTag("ar-SA")
        _ = try BCP47.LanguageTag("he-IL")
    }
}

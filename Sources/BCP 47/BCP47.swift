// BCP47.swift
// BCP 47
//
// Best Current Practice 47: Tags for Identifying Languages

@_exported import RFC_5646
import Standards

/// BCP 47: Best Current Practice for Tags for Identifying Languages
///
/// BCP 47 is the IETF's Best Current Practice for language tags, which encompasses:
/// - RFC 5646: Tags for Identifying Languages (language tag syntax)
/// - RFC 4647: Matching of Language Tags (language tag matching)
///
/// This package re-exports RFC 5646 and provides the commonly-used `BCP47` namespace.
///
/// ## References
/// - [BCP 47](https://www.rfc-editor.org/info/bcp47) - Best Current Practice
/// - [RFC 5646](https://datatracker.ietf.org/doc/html/rfc5646) - Tags for Identifying Languages
/// - [RFC 4647](https://datatracker.ietf.org/doc/html/rfc4647) - Matching of Language Tags
///
/// ## Examples
///
/// ```swift
/// // Using BCP47 namespace (re-exported from RFC 5646)
/// let english = try BCP47.LanguageTag("en")
/// let americanEnglish = try BCP47.LanguageTag("en-US")
/// let simplifiedChinese = try BCP47.LanguageTag("zh-Hans")
/// let serbianLatin = try BCP47.LanguageTag("sr-Latn-RS")
/// ```
public enum BCP47 {
    /// Language tag per RFC 5646 (re-exported)
    public typealias LanguageTag = RFC_5646.LanguageTag

    /// Errors that can occur when parsing or validating language tags (re-exported)
    public typealias Error = RFC_5646.Error
}

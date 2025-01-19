class Logprobs {
  final List<String> tokens;
  final List<double>? tokenLogprobs;
  final List<(String, double)>? topLogprobs;
  final List<int> textOffset;

  const Logprobs({
    required this.tokens,
    this.tokenLogprobs,
    this.topLogprobs,
    required this.textOffset,
  });

  factory Logprobs.fromJson(Map<String, dynamic> json) {
    final List<String> tokens = [];
    if (json['tokens'] != null) {
      json['tokens'].forEach((v) {
        tokens.add(v);
      });
    }

    final List<double> tokenLogprobs = [];
    if (json['token_logprobs'] != null) {
      json['token_logprobs'].forEach((v) {
        tokenLogprobs.add(v);
      });
    }

    final List<(String, double)> topLogprobs = [];
    if (json['top_logprobs'] != null) {
      json['top_logprobs'].forEach((v) {
        topLogprobs.add((v[0], v[1]));
      });
    }

    final List<int> textOffset = [];
    if (json['text_offset'] != null) {
      json['text_offset'].forEach((v) {
        textOffset.add(v);
      });
    }

    return Logprobs(
      tokens: tokens,
      tokenLogprobs: tokenLogprobs,
      topLogprobs: topLogprobs,
      textOffset: textOffset,
    );
  }
}

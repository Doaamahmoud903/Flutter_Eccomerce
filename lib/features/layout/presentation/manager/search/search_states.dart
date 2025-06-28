class SearchState {
  final String keyword;

  const SearchState({required this.keyword});

  factory SearchState.initial() => const SearchState(keyword: '');

  SearchState copyWith({String? keyword}) {
    return SearchState(
      keyword: keyword ?? this.keyword,
    );
  }

  bool get isEmpty => keyword.trim().isEmpty;
  bool get isNotEmpty => keyword.trim().isNotEmpty;
}

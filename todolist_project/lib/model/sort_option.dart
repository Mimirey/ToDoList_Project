enum SortOption { urgent, penting, santai }

extension SortOptionExtension on SortOption {
  String get label {
    switch (this) {
      case SortOption.urgent:
        return "Urgent";
      case SortOption.penting:
        return "Penting";
      case SortOption.santai:
        return "Santai";
    }
  }
}
String getFirstNWords(String text, {int numberOfWords = 3}) {
  List<String> words = text.split(' ');
  if (words.length <= numberOfWords) {
    return text; // Return the full text if there are fewer words than required
  }
  return words.take(numberOfWords).join(' ') +
      '...'; // Add ellipsis for truncated text
}
